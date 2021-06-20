Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index]
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root "dashboard#index"
  get 'dashboard/index'
end
