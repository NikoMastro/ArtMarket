require 'securerandom'
require 'faker'

puts "destroy all database..."
Product.destroy_all
RentingRequest.destroy_all
Review.destroy_all
User.destroy_all

CATEGORIES = ["car", "watch", "jewelry", "others"]

# puts "generating Admin mail model: admin@gmail.com , pw: 123123"
# user = User.new(
#   name: "admin",
#   address: "yes",
#   password: "123123",
#   email: "admin@gmail.com"
# )
# user.save

puts "generating 15 User models..."
15.times do
  user = User.new(
    name: Faker::Name.name,
    address: Faker::Address.city,
    password: "123123",
    email: Faker::Internet.email
  )
  user.save
end
puts "generating yacht"
Product.create!(
  title: "Luxury Yacht",
  description: "6-cabin Benetti",
  price: rand(100000..10000000),
  category: "others",
  user_id: User.all.sample.id
)
puts "generating watch"
Product.create!(
  title: "Rolex Sky Dweller 4013LW",
  description: "Luxury Rolex watch",
  price: rand(100000..10000000),
  category: "watch",
  user_id: User.all.sample.id
)

Product.create!(
  title: "BMW i7",
  description: "Hi-tech car with cashmere interior",
  price: rand(100000..10000000),
  category: "car",
  user_id: User.all.sample.id
)


# puts "generating 10 Product models..."
# 10.times do
#   product = Product.new(
#     title: Faker::Movie.title,
#     description: Faker::Lorem.paragraph,
#     price: rand(100000..10000000),
#     category: CATEGORIES.sample
#   )
#   users = User.all
#   product.user_id = users.sample.id
#   product.save
# end


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
