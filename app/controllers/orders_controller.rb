class OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )

    product = Product.find_by(id: params[:product_id])

    @order.subtotal = @order.quantity * product.price
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax

    @order.save
    render :show
  end

  def show
    if current_user
      @order = Order.find_by(id: params[:id])
      render :show
    else
      render json: {message: "You are not logged in."}
    end
  end

  def index
    if current_user
      @orders = Order.all
      render :index
    else
      render json: {message: "You are not logged in."}
    end
  end
end
