//= require jquery
//= require modernizr/modernizr.js
//= require_tree .

ajaxLoad = (url) ->
  if (url != "#")
    history.pushState {}, '', url
    $('main').removeClass("fadeInUp animated")
    $('footer').css("display", "none")
    $('main').load "#{url} main > *", ->
      $('main').addClass("fadeInUp animated")
      $('main').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', ->
        $('footer').fadeIn("slow")

initialize = -> 
  history.replaceState
    path: window.location.href
  , ""

$ ->
  if Modernizr.history
    popState = (event) ->
      if event.originalEvent.state isnt null or not initialURL
        ajaxLoad(location.href)
      else
        initialURL = false
        badgerLogo
      false

    $(window).on "popstate", popState
    initialize()

    $(document).on "click",'a', (e) ->
      e.preventDefault()
      url = $(@).attr('href')
      ajaxLoad(url)