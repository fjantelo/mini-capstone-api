class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, length: { in: 10..500 }
  # validates :image_url, url: true

  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  # def categories
  #   category_products.map do |category_product|
  #     category_product.categories
  #   end
  # end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_dicounted?
    if price < 10
      true
    else
      false
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  def image_url
    Image.find_by(product_id: id).url # This should be changed to .where to show multiple images
  end
end
