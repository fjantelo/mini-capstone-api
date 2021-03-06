Rails.application.routes.draw do
  # products routes
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "products/:id" => "products#destroy"

  # suppliers routes
  get "/suppliers" => "suppliers#index"
  get "/suppliers/:id" => "suppliers#show"
  post "/suppliers" => "suppliers#create"
  patch "/suppliers/:id" => "suppliers#update"
  delete "suppliers/:id" => "suppliers#destroy"

  # users routes
  post "/users" => "users#create"

  #sessions routes
  post "/sessions" => "sessions#create"

  #order routes
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  #carted products routes
  post "/carted_products" => "carted_products#create"
  get "/carted_products" => "carted_products#index"
  delete "/carted_products/:id" => "carted_products#destroy"
end
