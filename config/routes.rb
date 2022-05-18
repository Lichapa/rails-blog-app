Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  

 get '/posts/new', to: 'posts#new', as: :new_post

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  root to: "home#index"

end
