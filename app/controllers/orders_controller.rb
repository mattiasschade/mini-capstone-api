class OrdersController < ApplicationController
 
  before_action :authenticate_user

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )

    @product = Product.find_by(id: params[:product_id])

    @order.subtotal = @order.quantity * @product.price
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax

    @order.save
    render :show
  end

  
  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    render :show
  end

  def index
    @orders = current_user.orders
    render :index
  end
end
