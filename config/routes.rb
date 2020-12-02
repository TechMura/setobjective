Rails.application.routes.draw do
  devise_for :users
  root to: 'objectives#index'
  resources :objective, only: [:index]
end
