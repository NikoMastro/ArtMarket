class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to products_path
  end

  private

  def product_params
    params.require(:list).permit(:title, :description, :price, :category)

end
