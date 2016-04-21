Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  root 'statics#home'
end
