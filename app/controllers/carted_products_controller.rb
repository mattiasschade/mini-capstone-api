class CartedProductsController < ApplicationController


  def create
    @carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )

    @carted_product.save
    render :show
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")

    render :index
  end
end
