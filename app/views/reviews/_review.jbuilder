json.(review, :id, :rating, :abstract)
json.likes_count 23
json.author do
  json.partial! "users/minimal_user", user: review.user
end
json.movie do
  json.partial! "movies/minimal_movie", movie: review.movie
end
json.some_likers review.review_likes.take(3) do |like|
  json.partial! "users/minimal_user", user: like.user
end

