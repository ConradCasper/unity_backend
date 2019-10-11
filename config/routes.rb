Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :follows, only: [:create, :destroy, :index]
      resources :likes, only: [:create, :destroy, :index]
      resources :comments, only: [:create, :destroy, :index]
      resources :users, only: [:create, :edit, :update, :destroy, :index, :show]
      resources :posts, only: [:create, :edit, :update, :destroy, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end


end
