class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render json: @suppliers.as_json
    # render template: "suppliers/index"
  end

  def show
    @supplier = Supplier.find_by(id: params["id"])
    render json: @supplier.as_json
    # render template: "suppliers/show"
  end

  def create
    @supplier = Supplier.new(
      name: params["name"],
      email: params["email"],
      phone_number: params["phone_number"],
    )
    if @supplier.save
      render json: @supplier.as_json
    else
      render json: { "error": @supplier.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @supplier = Supplier.find_by(id: params["id"])
    @supplier.name = params["name"] || @supplier.name
    @supplier.email = params["email"] || @supplier.email
    @supplier.phone_number = params["phone_number"] || @supplier.phone_number
    if @supplier.save
      render json: @supplier.as_json
    else
      render json: { "error": @product.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    supplier = Supplier.find_by(id: params["id"])
    supplier.destroy
    render json: { "message": "Supplier successfully deleted." }
  end
end
