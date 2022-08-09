Rails.application.routes.draw do
  resources :requests
  resources :units
  resources :requests, path: :client
  resources :units, path: :uf
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
