class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    @review.save

    if @review.save
      redirect_to @restaurant, notice: 'Your review was published.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
