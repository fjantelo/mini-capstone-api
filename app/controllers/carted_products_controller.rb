class CartedProductsController < ApplicationController
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      status: "carted",
      order_id: nil,
      quantity: params[:quantity],
    )
    carted_product.save
    render json: carted_product.as_json
  end

  def index
    carted_products = current_user.carted_products
    render json: carted_products.as_json
  end
end
