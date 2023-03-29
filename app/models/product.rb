class Product < ApplicationRecord

def show
  p "hello"
  @product = Product.find_by(id: 1)
  render template: "products/show"
end

