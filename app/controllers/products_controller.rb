class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @products = Product.all
    if params[:query].present?
      @products = Product.search_by_title_and_description(params[:query])
    elsif params[:category].present?
      @products = Product.search_by_category(params[:category])
    end
  end

  def show
    # @product = Product.find(params[:id])
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

  def own_products
    @own_products = current_user.products
    # @renting_requests = RentingRequest.
  end

  def featured
    @last_product = Product.last
  end

  # def research
  #   @products =
  #   if params[:q].present?
  #     Product.search(params[:q])
  #   else
  #     Product.All
  #   end

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

  def search
    if params[:query].present?
      @products = Product.search_by_title_and_description(:query)
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category, photos: [])
  end
end
