Rails.application.routes.draw do


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



resources :posts, only: [:new, :create, :index]

root "posts#index"
get "/posts/new.html.erb", to: "posts#new", as: "new"
end
