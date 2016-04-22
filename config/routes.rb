Rails.application.routes.draw do

  get 'games/index'

  get 'games/new'

  get 'games/show'

  get 'games/create'

  get 'games/edit'

  get 'games/destroy'

  get 'games/update'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups do
    resources :subscribers, only: [:create, :destroy]
  end
  root 'statics#home'
end
