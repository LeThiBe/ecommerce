Rails.application.routes.draw do
  get "order_products/index"

  get "order_products/show"

  get "order_products/new"

  get "sessions/new"
  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "line_items/:id/add" => "line_items#add_quantity", as: "line_item_add"
  post "line_items/:id/reduce" => "line_items#reduce_quantity", as: "line_item_reduce"
  resources :line_items
  resources :order_products
  resources :carts
  resources :users
  resources :categories
  resources :account_activations, only: :edit
  resources :products
  namespace :admin do
    root "static_pages#home"
    resources :users, except: [:show, :new, :create]
  end
end
