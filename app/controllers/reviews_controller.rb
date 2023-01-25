class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]
  def new
    @review = Review.new
  end

  private

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
