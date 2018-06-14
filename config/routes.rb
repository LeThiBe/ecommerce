Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'

  get 'password_resets/new'

  get 'password_resets/edit'

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
  resources :my_orders, only: [:index]
  resources :carts
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :categories
  resources :account_activations, only: :edit
  resources :products do
    resources :reviews
  end

  namespace :admin do
    root "users#index"
    resources :users, except: :show
    resources :products, except: :show
    resources :categories, except: :show
    resources :order_products
  end
end
