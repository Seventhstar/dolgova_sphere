Rails.application.routes.draw do
  get 'team/index'
  get 'static/index', to: 'static#index'
  root to: "static#index" 
end
