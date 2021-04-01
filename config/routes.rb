Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"
  get 'dashboard/index'
end
