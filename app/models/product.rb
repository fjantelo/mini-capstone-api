class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :image_url, url: true

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
end
