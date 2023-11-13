Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "venues#index"
  get 'testing', to: 'pages#testing'

  resources :venues, param: :slug, only: [ :show, :new, :create, :edit, :update, :destroy ]
end
