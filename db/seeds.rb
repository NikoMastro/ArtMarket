
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
