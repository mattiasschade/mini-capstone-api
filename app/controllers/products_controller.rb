class ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]
  
  def show
    @product = Product.find_by(id: params[:id])
    render :show
  end

  def index
    @products = Product.all
    if current_user
      render :index
    else
      render json: {message: "You are not logged in! Denied"}, status: :unauthorized  
    end
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    if @product.save
      render :show
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])

    @product.destroy
    render json: {message: "Product successfully deleted."}
  end
end
