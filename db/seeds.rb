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

Product.create!(
  title: "Ferrari Purosangue",
  description: "4-seater cabriolet",
  price: rand(100000..10000000),
  category: "car",
  user_id: User.all.sample.id
)

Product.create!(
  title: "Ferrari 296 GTS",
  description: "2-seater cabriolet",
  price: rand(100000..10000000),
  category: "car",
  user_id: User.all.sample.id
)

Product.create!(
  title: "Rolex Submariner",
  description: "
  This is a superb example of a 'no-date' Submariner—a model that is prized for its cleaner, pared-down look and symmetrical design that many collectors appreciate. The ref 114060 follows on from and updates the 14060M, which began life with series P in the year 2000—but its predecessor, the plain 14060, was in production as early as 1990. Fans will also point out that the original Submariners, from their introduction in 1953, did not have date windows. While this model continues to use the flawless in-house calibre 3130, it vastly improves the bezel with high-tech ceramic and also upgrades the bracelet.\n\nThis Rolex Submariner 114060 has a black dial and a bracelet strap. This Rolex has undergone a thorough inspection of water resistance, accuracy, functionality and condition to determine the level of reconditioning required to meet our strict standards. It has also been referenced against technical documents and manufacturer records where available to ensure authenticity and a clean history. All our watches have a 24-month warranty for your peace of mind. One of our skilled polishing technicians has removed marks on the case and bracelet of this watch, brought about by daily wear and tear, which is why this watch does not come with the remaining manufacturer’s warranty.",
  price: rand(100000..10000000),
  category: "watch",
  user_id: User.all.sample.id
)

Product.create!(
  title: "Morganite Arden Diamond Ring with Lab Emerald Accents",
  description: "Budding round and marquise diamonds, lab grown emeralds, and green tsavorite garnets glimmer on each side of the center gem in this nature-inspired trellis ring (1/15 total carat weight).",
  price: rand(100000..10000000),
  category: "jewelry",
  user_id: User.all.sample.id
)

Product.create!(
  title: "Freesia 2mm Solitaire Engagement Ring",
  description: "Lustrous metal flows upwards like vines reaching towards the sun in this subtly nature-inspired solitaire ring that secures the center stone in classic claw prongs. The band gently tapers from 2mm to 1.2mm to complete the look with a sleek finish.\n\nAs a Brilliant Pick, this piece displays the best and brightest in fashion and design and is beloved by Brilliant Earth designers and customers alike.",
  price: rand(100000..10000000),
  category: "jewelry",
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
