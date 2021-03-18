Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root to: 'objectives#index'
  resources :objectives
  resources :menus, only: [:new, :create, :destroy] do
    collection do
      get 'multi_edit'
      post 'add_create'
      get 'multi_delete'
    end
    member do
      get 'achieved'
      get 'reset_achieve_flag'
    end
  end
end
