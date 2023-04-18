class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  validates :name, presence: true
  validates :price, presence: true
  validates :description, length: { minimum: 8 }

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  # def subtotal
  #   price
  # end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
