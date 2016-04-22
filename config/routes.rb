Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups do
    resources :subscribers, only: [:create, :destroy]
  end
  resources :games
  root 'statics#home'
end
