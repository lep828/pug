Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show]
  resources :groups do
    resources :subscribers, only: [:create, :destroy]
  end
  resources :games do
    collection do 
      post '/add', to: "games#add"
    end
  end
  root 'statics#home'
end
