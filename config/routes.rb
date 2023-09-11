Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'reset_password',
    confirmation: 'verification',
    unlock: 'unlock_account',
    registration: 'sign_up',
    sign_up: '',
  }

  root 'splash#index'
end
