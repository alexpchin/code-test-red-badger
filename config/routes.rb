Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :worlds do
    resources :robots do
      resources :moves
    end
  end

end
