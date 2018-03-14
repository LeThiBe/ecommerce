Rails.application.routes.draw do
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  resources :users
  resources :account_activations, only: :edit
end
