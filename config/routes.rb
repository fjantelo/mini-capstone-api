Rails.application.routes.draw do
  get "/all_products", controller: "products", action: "all_products"
  get "/headphones", controller: "products", action: "headphones"
  get "/skillet", controller: "products", action: "skillet"
  get "/sunglasses", controller: "products", action: "sunglasses"
end
