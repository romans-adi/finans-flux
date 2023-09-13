Rails.application.routes.draw do
  get 'movements/index'
  get 'movements/show'
  get 'movements/new'
  get 'movements/create'

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'reset_password',
    confirmation: 'verification',
    unlock: 'unlock_account',
    registration: 'sign_up',
    sign_up: '',
  }

  root 'splash#index', as: :splash_root

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  resources :categories do
    resources :movements
  end
end
