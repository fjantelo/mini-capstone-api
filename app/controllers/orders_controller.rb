class OrdersController < ApplicationController
  def index
    order = Order.where(user_id: current_user.id)
    render json: order.as_json
  end

  def show
    authenticate_user
    order = Order.find_by(id: params["id"])
    if order.user_id == current_user.id
      render json: order.as_json
    else
      render json: { "message": "Unauthorized user" }
    end
  end

  def create
    product = Product.find_by(id: params["product_id"])
    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: product.price,
      tax: product.tax,
      total: product.total,
    )
    order.save
    render json: { "message": "Order created" }
  end
end
