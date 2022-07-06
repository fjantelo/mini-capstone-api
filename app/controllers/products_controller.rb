class ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: products.as_json
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    # render json: product.as_json(methods: [:friendly_created_at, :is_dicounted?, :tax, :total])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
    )
    @product.save
    render :show
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    @product.save
    render :show
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { "message": "Product successfully deleted." }
  end
end
