Rails.application.routes.draw do
  get 'subscribers/create'

  get 'subscribers/destroy'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups

  root 'statics#home'
end
