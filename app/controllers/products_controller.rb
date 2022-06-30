class ProductsController < ApplicationController
  def all_products
    render json: { product_data: Product.all }
  end
end
