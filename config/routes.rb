Rails.application.routes.draw do

  root 'statics#home'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
  
  resources :groups do
    resources :subscribers, only: [:create, :destroy]
  end

  resources :games do
    collection do
      post '/add', to: "games#add"
    end
  end

end
