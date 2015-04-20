class MoviePresenter < JsonPresenters
  def self.minimal_hash(movie)
    hash_for(movie, %w(id title year image))
  end
end
