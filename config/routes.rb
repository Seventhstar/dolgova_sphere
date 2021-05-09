Rails.application.routes.draw do
#  resources :users, only: [:show]
  devise_for :users, ActiveAdmin::Devise.config
#   devise_for :users, controllers: { registrations: 'users/registrations' }
  ActiveAdmin.routes(self)
  get 'team', to: 'team#index'
  get 'team/:id', to: 'user#show'
  get 'static/index', to: 'static#index'
  get 'users/:id', to: 'user#show'
  root to: "static#index" 
end
