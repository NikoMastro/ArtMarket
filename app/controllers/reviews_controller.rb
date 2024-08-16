class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  # def new
  #   @review = Review.new
  # end

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.user = current_user
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    else
      render 'products/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
