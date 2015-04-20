class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie
  has_many :review_likes

  def self.popular(limit = 10)
    Review.select("reviews.*, count(review_likes.id) as likes_count")
      .joins(:review_likes)
      .group("reviews.id")
      .order("likes_count desc")
      .limit(limit)
  end

  def self.popular_fake(limit = 10)
    reviews = []
    a_user = User.new username: "Joelinch", avatar: "http://s3.bucket/path/to/image.png"
    a_movie = Movie.new title: "Movie title", year: 1985, image: "http://s3.bucket/path/to/image.png"
    limit.times do
      review = Review.new rating: 8, abstract: "funtastic, adorable, must see"
      review.user = a_user
      review.movie = a_movie
      review.review_likes.build user: a_user
      review.review_likes.build user: a_user
      review.review_likes.build user: a_user
      reviews << review
    end
    reviews
  end

end
