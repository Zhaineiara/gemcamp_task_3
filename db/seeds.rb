# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Genre.destroy_all
Movie.destroy_all

genres = [
  { name: 'Action' },
  { name: 'Comedy' },
  { name: 'Drama' },
  { name: 'Horror' },
  { name: 'Thriller' },
  { name: 'Science Fiction' },
  { name: 'Romance' },
  { name: 'Adventure' },
  { name: 'Fantasy' },
  { name: 'Mystery' },
  { name: 'Documentary' },
  { name: 'Animation' },
  { name: 'Musical' },
  { name: 'Western' },
  { name: 'Historical' },
  { name: 'Crime' },
  { name: 'War' },
  { name: 'Sport' },
  { name: 'Family' },
  { name: 'Biography' }
]

genres.each do |genre_attributes|
  Genre.create(genre_attributes)
end

# USING FAKER
#
10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8)
  )
end

puts "Created #{User.count} users."

10.times do
  Movie.create(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    date_released: Faker::Date.between(from: '1900-01-01', to: Date.today),
    country_of_origin: Faker::Address.country,
    showing_start: Faker::Time.forward(days: rand(1..10), period: :evening),
    showing_end: Faker::Time.forward(days: rand(11..20), period: :evening),
    user: User.all.sample # Assign a random user to each movie
  )
end

movie.genres << Genre.order('RANDOM()').limit(rand(1..3))
puts "Created #{Movie.count} movies with associated genres."
