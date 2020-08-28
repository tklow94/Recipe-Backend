Rails.application.routes.draw do
  resources :users, only: [:create, :index, :show, :update, :destroy]
  resources :follows, only: [:index, :create, :destroy]
  post '/login', to: "authentications#login"
  resources :comments do
    resources :comments, only: [:create, :destroy]
  end

  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end



 




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
