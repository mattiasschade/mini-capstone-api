class ProductsController < ApplicationController
  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def index
    @products = Product.all
    render :index
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    @product.save
    render :show
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = "turtle"
    @product.price = 50
    @product.image_url = "test_url"
    @product.description = "not too fast."

    @product.save
    render :show
  end
end
