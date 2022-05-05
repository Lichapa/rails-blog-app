Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "users#index"

  get "/users", to: "users#index"
  get "/users/:id/posts", to: "posts#posts"
  get "/users/:id", to: "users#user"
  get "/users/:id/posts/:id", to: "posts#post"
end
