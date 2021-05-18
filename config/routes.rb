Rails.application.routes.draw do
  get 'contacts/index'
# resources :users, only: [:show]
  devise_for :users, ActiveAdmin::Devise.config
# devise_for :users, controllers: { registrations: 'users/registrations' }

  ActiveAdmin.routes(self)

  get 'team', to: 'team#index'
  get 'team/:id', to: 'user#show'
  get 'users/:id', to: 'user#show'
  get 'course/:id', to: 'course#show'

  get 'contacts', to: 'contact#index'

  get 'static/index', to: 'static#index' 
  root to: "static#index" 
end
