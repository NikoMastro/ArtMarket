class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @renting_request = RentingRequest.new
  end

  def new
    @product = Product.new
    @category = ['Jewelries', 'Watches & Bracelets', 'Suits & Dress', 'Sports car & Vintage', 'Boats']
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def featured
    @last_product = Product.last
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
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
    params.require(:product).permit(:title, :description, :price, :category)
  end

end
