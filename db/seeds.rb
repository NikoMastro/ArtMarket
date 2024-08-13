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
