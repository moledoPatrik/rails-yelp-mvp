class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(permitted_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render new_restaurant_review_path, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:review).permit(:content, :rating)
  end
end
