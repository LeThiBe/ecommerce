class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Comment created"
      redirect_to @product
    else
      flash[:danger] = "Comment dont create"
      redirect_to request.referer || root_url
    end
  end
private

  def review_params
    params.require(:review).permit :product_id, :conten
  end
end
