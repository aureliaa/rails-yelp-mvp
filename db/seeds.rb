# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts 'Cleaning database...'
Restaurant.destroy_all
Review.destroy_all

puts 'Creating restaurants...'
20.times do
  restaurant = Restaurant.new(
    name:         Faker::StarTrek.location,
    address:      "#{Faker::Address.street_address} #{Faker::Address.city}",
    phone_number: Faker::PhoneNumber.phone_number,
    category:     ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
    )
  restaurant.save
5.times do
    review = Review.new(
    rating: [0, 1, 2, 3, 4, 5].sample,
    content: Faker::Lorem.paragraph,
    restaurant: restaurant
    )
  review.save
end
end
puts 'Finished!'
