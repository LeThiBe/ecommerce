Rails.application.routes.draw do
  get "sessions/new"

  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :account_activations, only: :edit
  resources :products
  namespace :admin do
    root to: "static_pages#home"
    resources :admins
  end
end
