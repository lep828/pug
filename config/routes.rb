Rails.application.routes.draw do

  root 'statics#home'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
  
  resources :groups do
    resources :subscribers, only: [:create, :destroy] do
      member do
        get '/admin', to: "subscribers#admin"
      end
    end
  end

  resources :games do
    collection do
      post '/add', to: "games#add"
    end
  end

end
