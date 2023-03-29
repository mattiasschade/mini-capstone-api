class ProductsController < ApplicationController
  def show
    p "hello"
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def all
    p "hello"
    @products = Product.all
    render template: "products/index"
  end
end
