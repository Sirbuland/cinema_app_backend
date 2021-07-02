# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

internal_user = User.create(email: 'john.doe@gmail.com', first_name: 'John', last_name: 'Doe', user_type: 'internal', password: '12345678')
customer  = User.create(email: 'john.customer@gmail.com', first_name: 'John', last_name: 'Customer', user_type: 'customer', password: '12345678')
movie = Movie.create(title: 'The Fast and Furious', description: 'it is first movie of the database')
movie2 = Movie.create(title: '2 Fast 2 Furious', description: 'it is the second movie of database, movie description will come here in this field')
movie3 = Movie.create(title: 'The Fast and the Furious: Tokyo Drift', description: 'it is the second movie of database, movie description will come here in this field')
movie4 = Movie.create(title: 'Fast & Furious', description: 'it is the second movie of database, movie description will come here in this field')
movie5 = Movie.create(title: 'Fast Five', description: 'it is the second movie of database, movie description will come here in this field')
movie6 = Movie.create(title: 'Fast & Furious 6', description: 'it is the second movie of database, movie description will come here in this field')
movie7 = Movie.create(title: 'Furious 7', description: 'it is the second movie of database, movie description will come here in this field')
movie8 = Movie.create(title: 'The Fate of the Furious', description: 'it is the second movie of database, movie description will come here in this field')


movie.shows.create(time: 2.hour.from_now, price: 10)
movie.shows.create(time: 4.hour.from_now, price: 10)
movie.shows.create(time: 6.hour.from_now, price: 10)
movie.shows.create(time: 8.hour.from_now, price: 10)
movie.shows.create(time: 10.hour.from_now, price: 10)

movie.ratings.create(star_rating: 5, review: "It's a very good movie I like it", user_id: customer.id)

movie2.shows.create(time: 1.hour.from_now, price: 10)
movie2.shows.create(time: 3.hour.from_now, price: 15)
movie2.shows.create(time: 5.hour.from_now, price: 20)
movie2.shows.create(time: 7.hour.from_now, price: 25)
movie2.shows.create(time: 9.hour.from_now, price: 30)

movie2.ratings.create(star_rating: 4, review: "It's a very good movie I like it", user_id: customer.id)

movie3.shows.create(time: 1.hour.from_now, price: 10)
movie3.shows.create(time: 3.hour.from_now, price: 15)
movie3.shows.create(time: 5.hour.from_now, price: 20)
movie3.shows.create(time: 7.hour.from_now, price: 25)
movie3.shows.create(time: 9.hour.from_now, price: 30)
movie3.ratings.create(star_rating: 5, review: "It's a very good movie I like it", user_id: customer.id)

movie4.shows.create(time: 1.hour.from_now, price: 10)
movie4.shows.create(time: 3.hour.from_now, price: 15)
movie4.shows.create(time: 5.hour.from_now, price: 20)
movie4.shows.create(time: 7.hour.from_now, price: 25)
movie4.shows.create(time: 9.hour.from_now, price: 30)
movie4.ratings.create(star_rating: 3, review: "It's a very good movie I like it", user_id: customer.id)

movie5.shows.create(time: 1.hour.from_now, price: 10)
movie5.shows.create(time: 3.hour.from_now, price: 15)
movie5.shows.create(time: 5.hour.from_now, price: 20)
movie5.shows.create(time: 7.hour.from_now, price: 25)
movie5.shows.create(time: 9.hour.from_now, price: 30)
movie5.ratings.create(star_rating: 5, review: "It's a very good movie I like it", user_id: customer.id)

movie6.shows.create(time: 1.hour.from_now, price: 10)
movie6.shows.create(time: 3.hour.from_now, price: 15)
movie6.shows.create(time: 5.hour.from_now, price: 20)
movie6.shows.create(time: 7.hour.from_now, price: 25)
movie6.shows.create(time: 9.hour.from_now, price: 30)
movie6.ratings.create(star_rating: 4, review: "It's a very good movie I like it", user_id: customer.id)

movie7.shows.create(time: 1.hour.from_now, price: 10)
movie7.shows.create(time: 3.hour.from_now, price: 15)
movie7.shows.create(time: 5.hour.from_now, price: 20)
movie7.shows.create(time: 7.hour.from_now, price: 25)
movie7.shows.create(time: 9.hour.from_now, price: 30)
movie7.ratings.create(star_rating: 4, review: "It's a very good movie I like it", user_id: customer.id)

movie8.shows.create(time: 1.hour.from_now, price: 10)
movie8.shows.create(time: 3.hour.from_now, price: 15)
movie8.shows.create(time: 5.hour.from_now, price: 20)
movie8.shows.create(time: 7.hour.from_now, price: 25)
movie8.shows.create(time: 9.hour.from_now, price: 30)
movie8.ratings.create(star_rating: 4, review: "It's a very good movie I like it", user_id: customer.id)
