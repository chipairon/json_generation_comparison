class UserPresenter < JsonPresenters
  def self.minimal_hash(user)
    hash_for(user, %w(id username avatar))
  end
end
