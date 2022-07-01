class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params["id"])
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: "JanSport JS0A4QUE008",
      price: 39,
      image_url: "https://m.media-amazon.com/images/I/817EuMPlOOL._AC_SL1500_.jpg",
      description: "JanSport JS0A4QUE008 Superbreak Plus Black",
    )
    product.save
  end
end
