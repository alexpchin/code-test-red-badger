Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :worlds, only: [:index, :show, :new, :create] do
    resources :robots, only: [:new, :create] do
      resources :moves, only: [:new, :create]
    end
  end

end
