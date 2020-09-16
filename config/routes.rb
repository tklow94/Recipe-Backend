Rails.application.routes.draw do
  resources :users 
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  post '/users/:id', to: "users#update"
  post '/login', to: "authentications#login"
  
  resources :comments do
    resources :comments, only: [:index, :create, :destroy]
  end

  resources :recipes do
    resources :comments, only: [:index, :create, :destroy]
  end
end
