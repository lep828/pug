Rails.application.routes.draw do
  get 'group/index'

  get 'group/show'

  get 'group/edit'

  get 'group/new'

  get 'group/update'

  get 'group/delete'

  get 'group/create'

  devise_for :users
  resources :users, only: [:index, :show]

  root 'statics#home'
end
