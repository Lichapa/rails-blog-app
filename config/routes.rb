Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  

 get '/posts/new', to: 'posts#new', as: :new_post

  resources :users do
    resources :posts, only:[:index, :create, :show]
  end

  resources :posts do
    resources :comments
    resources :likes
  end

  root "users#index"

end
