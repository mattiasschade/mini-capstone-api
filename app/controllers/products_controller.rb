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
    @product = Product.new(name: "Spinach", price: 3, image_url: "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcSMhJ4Gdj8tbvRCcnK5wScleb_Ks6kK78EtNDz1Yz5Z4OQUtzOJaKN4moODiz5-wLbe0oK8NFnS6_vSVtc", description: "Popeye swears by the stuff.")
    @product.save
    render :show
  end
end
