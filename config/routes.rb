Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :moves

  root :to => 'worlds#new', id: 'home'  
  resources :robots
  resources :worlds

end
