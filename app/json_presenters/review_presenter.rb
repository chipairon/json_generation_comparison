class ReviewPresenter < JsonPresenters
  def self.minimal_hash(review)
    node = hash_for(review, %w(id rating abstract))
    node[:likes_count] = 23
    node[:author] = UserPresenter.minimal_hash(review.user)
    node[:movie] = MoviePresenter.minimal_hash(review.movie)
    node[:some_likers] = review.review_likes.last(3).map do |like|
      UserPresenter.minimal_hash(like.user)
    end
    node
  end

  def self.minimal_hash_for_collection(collection)
    collection.map { |item| minimal_hash(item) }
  end
end
