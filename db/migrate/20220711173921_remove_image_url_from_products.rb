class RemoveImageUrlFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :image_url, :string
    add_column :images, :product_id, :integer
  end
end
