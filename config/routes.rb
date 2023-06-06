Rails.application.routes.draw do
  resources :venues
  devise_for :users
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
