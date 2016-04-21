Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups

  root 'statics#home'
end
