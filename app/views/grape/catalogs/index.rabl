collection @shows, object_root: false
attributes :id, :time, :price
node :movie_id do |show|
  show.movie.id
end
node :movie_title do |show|
  show.movie.title
end
