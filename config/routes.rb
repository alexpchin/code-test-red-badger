Rails.application.routes.draw do
  resources :moves

  root :to => 'worlds#new', id: 'home'  
  resources :robots
  resources :worlds

end
