class AddQuantityToCartedProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :carted_products, :quantity, :integer
  end
end
