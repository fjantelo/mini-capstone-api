class ProductsController < ApplicationController
  def all_products
    render json: { product_data: Product.all }
  end

  def headphones
    render json: { product_data: Product.first }
  end

  def skillet
    render json: { product_data: Product.find_by(id: 2) }
  end

  def sunglasses
    render json: { product_data: Product.find_by(id: 3) }
  end
end
