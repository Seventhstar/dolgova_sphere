Rails.application.routes.draw do
  get 'project/index'
  get 'price/index'
  get 'contacts/index'
# resources :users, only: [:show]
  devise_for :users, ActiveAdmin::Devise.config
  resources :users do
    member do
      delete :delete_avatar
    end
  end

# devise_for :users, controllers: { registrations: 'users/registrations' }

  ActiveAdmin.routes(self)

  get 'team', to: 'team#index'
  get 'team/:id', to: 'users#show'
  get 'users/:id', to: 'users#show'
  get 'course/:id', to: 'course#show'

  get 'contacts', to: 'contact#index'

  get 'static/index', to: 'static#index' 
  root to: "static#index" 
end
