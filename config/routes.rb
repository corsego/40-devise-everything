Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index]
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
