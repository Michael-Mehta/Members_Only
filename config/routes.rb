Rails.application.routes.draw do


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "posts#index"


resources :posts, only: [:new, :create, :index]

get "/posts/new.html.erb", to: "posts#create", as: "create"
get "/posts/new.html.erb", to: "posts#new", as: "new"
end
