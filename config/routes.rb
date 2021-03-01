Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: 'objectives#index'
  resources :objectives
  resources :menus, only: [:new, :create, :destroy] do
    collection do
      get 'add_edit'
      post 'add_update'
      get 'multi_delete'
    end
    member do
      get 'achieved'
      get 'reset_achieve_flag'
    end
  end
end
