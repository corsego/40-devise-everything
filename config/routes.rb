Rails.application.routes.draw do
  resources :posts
  resources :users, only: [:index] do
    member do
      patch :ban
    end
  end
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root "dashboard#index"
  get 'dashboard/index'
end
