Rails.application.routes.draw do
  get 'static/index', to: 'static#index'
  root to: "static#index" 
end
