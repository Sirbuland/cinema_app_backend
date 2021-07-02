collection @ratings, object_root: false
attributes :star_rating, :review
node :movie_title do |rating|
  rating.movie.title
end
