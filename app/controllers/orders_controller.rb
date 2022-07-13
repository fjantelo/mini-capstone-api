class OrdersController < ApplicationController
  def index
    if current_user
      orders = Order.where(user_id: current_user.id) # can also do current_user.orders
      render json: orders.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def show
    if current_user
      order = current_user.orders.find_by(id: params["id"])
      render json: order.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    if current_user
      product = Product.find_by(id: params["product_id"])
      calculated_subtotal = product.price * params[:quantity].to_i
      calculated_tax = calculated_subtotal * 0.09
      calculated_total = calculated_subtotal + calculated_tax

      order = Order.new(
        user_id: current_user.id,
        product_id: params["product_id"],
        quantity: params["quantity"],
        subtotal: calculated_subtotal,
        tax: calculated_tax,
        total: calculated_total,
      )
      order.save
      render json: order.as_json
    else
      render json: [], status: :unauthorized
    end
  end
end
