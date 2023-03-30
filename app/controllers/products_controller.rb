class ProductsController < ApplicationController
  def show
    p "hello"
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

  def index
    @products = Product.all
    render :index
  end
end
