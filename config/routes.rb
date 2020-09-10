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


  # get "photo/:id", to: "photos#show"
  #     patch "photo/:id", to: "photos#update"


 




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
