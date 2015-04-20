# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1000.times do |i|
  User.create(username: "User ##{i}", avatar: "http://an.s3.bucket/users/#{i}/avatar.png")
  Movie.create(title: "Title ##{i}", year: 1985,
    image: "http://an.s3.bucket/movies/#{i}/image.png")

end

rng = Random.new

500.times do
  review = Review.create(
    movie_id: rng.rand(1..1000),
    user_id: rng.rand(1..1000),
    rating: 9,
    abstract: "Stunning, amazingly done.",
    text: <<-TEXT
      The standard Lorem Ipsum passage, used since the 1500s

      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

      Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC

      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    TEXT
    )
  likes_count = rng.rand(0..100)
  likes_count.times do
    review.review_likes.create(user_id: rng.rand(1..1000))
  end
end

