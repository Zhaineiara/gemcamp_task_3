# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Genre.destroy_all

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
