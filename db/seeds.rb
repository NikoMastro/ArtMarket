<<<<<<< HEAD
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# User.create!(
#   name: "Canned Heat",
#   address: "In my heels",
#   password: "12345678",
#   email_address: "jami@roquai.com"
# )
# User.create!(
#   name: "Astley",
#   address: "Never gonna give you up",
#   password: "12345678",
#   email_address: "nevergonna@letudown.com"
# )

# Product.create!(
#   title: "Luxury Shoes",
#   description: "I was born to run and built to last, you've never seen my feet 'cause they're goin' so fast",
#   price: 99,
#   category: "clothes",
#   user: User.find(1)
# )
#  puts "monkey"

Product.destroy_all
=======
require 'securerandom'
require 'faker'

puts "destroy all database..."
Product.destroy_all
RentingRequest.destroy_all
Review.destroy_all
User.destroy_all

CATEGORIES = ["car", "watch", "jewelry", "others"]

puts "generating 15 User models..."
15.times do
  username = Faker::Name.name
  user = User.new(
    name: username,
    address: Faker::Address.city,
    password: "123123",
    email_address: "#{username}@gmail.com"
  )
  user.save
end

puts "generating 10 Product models..."
10.times do
  product = Product.new(
    title: Faker::Movie.title,
    description: Faker::Lorem.paragraph,
    price: rand(100000..100000000),
    category: CATEGORIES.sample
  )
  users = User.all
  product.user_id = users.sample.id
  product.save
end


puts "generating 10 Renting_request models..."
STATUS = ["pending", "rejected", "accepted"]
renting_duration = rand(10)
10.times do
  start_date = Faker::Date.between(from: '2024-08-01', to: '2024-08-30')
  renting_request = RentingRequest.new(
    start_date: "#{start_date}",
    end_date: "#{start_date + renting_duration}",
    status: STATUS.sample
  )
  user = User.all.sample
  product = Product.all.sample
  renting_request.user_id = user.id
  renting_request.product_id = product.id
  renting_request.total_price = product.price * renting_duration
  renting_request.save
end

puts "generating 10 Review models..."
10.times do
  review = Review.new(
    content: Faker::Lorem.paragraph,
    rating: rand(5)
  )
  user = User.all.sample
  product = Product.all.sample
  review.user_id = user.id
  review.product_id = product.id
  review.save
end
>>>>>>> ed10fef408813126010224bb71aeba9a6f4c4d7b
