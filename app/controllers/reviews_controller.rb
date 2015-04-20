class ReviewsController < ApplicationController
  def popular_with_partial_views
    @reviews = Review.popular_fake(100)
    render :reviews
  end

  def popular_without_partial_views
    @reviews = Review.popular_fake(100)
    render json: ReviewPresenter.minimal_hash_for_collection(@reviews)
  end
end
