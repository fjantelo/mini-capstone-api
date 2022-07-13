class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    # pp current_user
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
      # image_url: params["image_url"],
      description: params["description"],
    )
    if @product.save
      render :show
    else
      render json: { "error": @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params["id"])
    @product.name = params["name"] || @product.name
    @product.price = params["price"] || @product.price
    # @product.image_url = params["image_url"] || @product.image_url
    @product.description = params["description"] || @product.description
    if @product.save
      render :show
    else
      render json: { "error": @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params["id"])
    product.destroy
    render json: { "message": "Product successfully deleted." }
  end
end
