Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :comments, only: [:create, :destroy]
      resources :users, only: [:create]
      resources :posts, only: [:create, :edit, :update, :destroy, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end


end
