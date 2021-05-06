Rails.application.routes.draw do
  resources :users, only: [:show]
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'team/index'
  get 'static/index', to: 'static#index'
  root to: "static#index" 
end
