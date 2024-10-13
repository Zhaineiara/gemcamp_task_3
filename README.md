# README

* Create movie records

```ruby =
Movie.create(title: "The Shawshank Redemption", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", date_released: Date.new(1994, 9, 23), country_of_origin: "United States", showing_start: DateTime.new(2024, 10, 1), showing_end: DateTime.new(2024, 10, 15))
Movie.create(title: "The Godfather", description: "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son.", date_released: Date.new(1972, 3, 24), country_of_origin: "United States", showing_start: DateTime.new(2024, 10, 5), showing_end: DateTime.new(2024, 10, 20))
Movie.create(title: "The Dark Knight", description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.", date_released: Date.new(2008, 7, 18), country_of_origin: "United States", showing_start: DateTime.new(2024, 10, 10), showing_end: DateTime.new(2024, 10, 25))
Movie.create(title: "Pulp Fiction", description: "The lives of two mob hitmen, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", date_released: Date.new(1994, 10, 14), country_of_origin: "United States", showing_start: DateTime.new(2024, 10, 15), showing_end: DateTime.new(2024, 10, 30))
Movie.create(title: "Schindler's List", description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution.", date_released: Date.new(1993, 12, 15), country_of_origin: "United States", showing_start: DateTime.new(2024, 10, 20), showing_end: DateTime.new(2024, 11, 5))
Movie.create(title: "The Lord of the Rings: The Return of the King", description: "Gandalf and Aragorn lead the World of Men against Sauron's army to save the free peoples of Middle-earth.", date_released: Date.new(2003, 12, 17), country_of_origin: "New Zealand", showing_start: DateTime.new(2024, 10, 25), showing_end: DateTime.new(2024, 11, 10))
Movie.create(title: "Forrest Gump", description: "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold through the perspective of an Alabama man with an IQ of 75.", date_released: Date.new(1994, 7, 6), country_of_origin: "United States", showing_start: DateTime.new(2024, 11, 1), showing_end: DateTime.new(2024, 11, 15))
Movie.create(title: "Inception", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.", date_released: Date.new(2010, 7, 16), country_of_origin: "United States", showing_start: DateTime.new(2024, 11, 5), showing_end: DateTime.new(2024, 11, 20))
Movie.create(title: "Fight Club", description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.", date_released: Date.new(1999, 10, 15), country_of_origin: "United States", showing_start: DateTime.new(2024, 11, 10), showing_end: DateTime.new(2024, 11, 25))
Movie.create(title: "The Matrix", description: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", date_released: Date.new(1999, 3, 31), country_of_origin: "United States", showing_start: DateTime.new(2024, 11, 15), showing_end: DateTime.new(2024, 11, 30))
```

* Create genre records

```ruby =
genres = Genre.create([
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
  { name: 'Historical' }
])
```
