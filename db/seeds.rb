require 'securerandom'
require 'faker'

puts "destroy all database..."
Product.destroy_all
RentingRequest.destroy_all
Review.destroy_all
User.destroy_all

CATEGORIES = ["Jewelries", "Watches & Bracelets", "Suits & Dresses", "Sports car & Vintage", "Boats"]

puts "generating 40 User models..."
40.times do
  user = User.new(
    name: Faker::Name.name,
    address: Faker::Address.city,
    password: "123123",
    email: Faker::Internet.email
  )
  user.save
end

puts "generating Boats.."
Product.create!(
  title: "Sunseeker 131 Yacht",
  description: "The Sunseeker 131 is a lavish superyacht
  featuring five spacious cabins, a large beach club, and an
  extensive sundeck with a jacuzzi.
  It’s known for its sleek design and state-of-the-art technology.",
  price: 29500000,
  category: "Boats",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Azimut Grande 35 Metri",
  description: "This Italian masterpiece offers elegance and luxury
  with its expansive deck spaces, a beach area, and a spacious
  interior that includes a panoramic lounge and five opulent
  cabins.",
  price: 24000000,
  category: "Boats",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Pershing 140",
  description: "The Pershing 140 is an ultra-luxurious superyacht known for its speed and high-performance design.
  It features spacious decks, a stylish interior, and a state-of-the-art entertainment system.",
  price: 37000000,
  category: "Boats",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Benetti Diamond 145",
  description: "The Benetti Diamond 145 is a majestic superyacht with six
  luxury cabins, a stunning main deck, and an impressive range of 3,600 nautical miles.
  The yacht is a blend of tradition and modernity.",
  price: 32000000,
  category: "Boats",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Feadship 92m",
  description: "This Dutch-built superyacht offers unparalleled luxury,
  with features like a private helipad, infinity pool,
  and an expansive owner's suite with panoramic views. It’s designed for the ultimate luxury cruising experience.",
  price: 155000000,
  category: "Boats",
  user_id: User.all.sample.id
)

puts "generating watches.."
Product.create!(
  title: "Patek Philippe Grand Complications Ref. 5270P-001",
  description: "This prestigious timepiece features a perpetual calendar,
  moon phases, and a chronograph. Crafted in platinum, it exudes sophistication and is a masterpiece of Patek Philippe's watchmaking expertise",
  price: 280000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Rolex Day-Date 40 Platinum",
  description: "Known as the 'President's Watch', the Rolex Day-Date 40 is made of platinum and features a smooth bezel,
  ice-blue dial, and the iconic President bracelet. It's a symbol of success and elegance.",
  price: 105000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Audemars Piguet Royal Oak Offshore Chronograph",
  description: "This bold, sporty timepiece is crafted from stainless steel and features a striking 'Méga Tapisserie' pattern on the dial. With its robust design and chronograph function, it’s both stylish and functional.",
  price: 58000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Vacheron Constantin Patrimony Perpetual Calendar Ultra-Thin",
  description: "This ultra-thin watch is a marvel of fine watchmaking, featuring a perpetual calendar and moon phase display. Its elegant design is housed in an 18k pink gold case, making it a timeless classic.",
  price: 58000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Richard Mille RM 11-03 Automatic Flyback Chronograph",
  description: "A modern marvel, this Richard Mille watch combines
  cutting-edge technology with luxury. Its skeletonized dial and flyback chronograph function are
  housed in a robust titanium case, making it a favorite among collector.",
  price: 299000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Jaeger-LeCoultre Reverso Tribute Duoface",
  description: "The Reverso is an iconic watch with a unique flip-over case,
  offering two dials for dual time zones. The Tribute Duoface version features a
  sleek, art-deco-inspired design in stainless steel.",
  price: 160000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Cartier Juste un Clou Bracelet",
  description: "The Juste un Clou bracelet is a bold piece by Cartier,
  designed to resemble a bent nail. Crafted in 18k yellow gold, it’s a statement of modern luxury.",
  price: 150000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Tiffany & Co. Diamond Tennis Bracelet",
  description: "This exquisite tennis bracelet from Tiffany & Co. features a
  continuous line of round brilliant diamonds set in platinum, perfect for adding sparkle to any outfit.",
  price: 450000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Bvlgari B.Zero1 Bracelet",
  description: "The B.Zero1 bracelet by Bvlgari is inspired
  by the Roman Colosseum, crafted in 18k rose gold. Its spiral design is modern and chic.",
  price: 80000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Van Cleef & Arpels Perlée Bracelet",
  description: "The Perlée bracelet is a delicate piece
  adorned with beads of 18k yellow gold, embodying the playful and elegant spirit of Van Cleef & Arpels.",
  price: 180000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Chopard Ice Cube Bracelet",
  description: "The Ice Cube bracelet by Chopard is a
  contemporary piece featuring geometric cubes in 18k white gold, set with diamonds. It’s both stylish and unique.",
  price: 120000,
  category: "Watches & Bracelets",
  user_id: User.all.sample.id
)


puts "generating Cars.."
Product.create!(
  title: "Ferrari SF90 Stradale",
  description: "The SF90 Stradale is Ferrari's most powerful road car,
  boasting a hybrid powertrain that delivers a combined 1,000 horsepower.
  Its sleek design and cutting-edge technology make it a supercar enthusiast's dream.",
  price: 650000,
  category: "Sports car & Vintage",
  user_id: User.all.sample.id
)
Product.create!(
  title: "McLaren 720S",
  description: "The McLaren 720S is a lightweight supercar
  with a 4.0L twin-turbo V8 engine delivering 720 horsepower.
  Its aerodynamic design and advanced suspension make it a top contender in the
  supercar world.",
  price: 4500000,
  category: "Sports car & Vintage",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Aston Martin DBS Superleggera",
  description: "The DBS Superleggera is Aston Martin’s flagship grand tourer,
  featuring a 5.2L twin-turbo V12 engine with 715 horsepower. It combines luxury with raw power, making it ideal for long-distance driving.",
  price: 3600000,
  category: "Sports car & Vintage",
  user_id: User.all.sample.id
)

puts "generating Jewels.."
Product.create!(
  title: "Cartier Love Necklacet",
  description: "The Cartier Love Necklace is an iconic piece, crafted in 18k rose gold with the signature screw motif.
  It’s a symbol of eternal love and elegance",
  price: 100000,
  category: "Jewelries",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Tiffany & Co. Victoria Diamond Vine Necklace",
  description: "This stunning necklace features a vine design with marquise and round
  diamonds set in platinum. It’s perfect for special occasions,
  exuding timeless beauty and luxury.",
  price: 500000,
  category: "Jewelries",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Bvlgari Serpenti Necklace",
  description: "The Bvlgari Serpenti Necklace is a mesmerizing piece that coils around
  the neck like a serpent, crafted in 18k white gold and adorned with pave diamonds.",
  price: 750000,
  category: "Jewelries",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Van Cleef & Arpels Alhambra Necklace",
  description: "This iconic necklace features the Alhambra clover motif in
  mother-of-pearl and 18k yellow gold. It’s a symbol of luck and refined taste.",
  price: 150000,
  category: "Jewelries",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Chopard Happy Diamonds Necklace",
  description: "The Happy Diamonds Necklace by Chopard
   features floating diamonds encased in a heart-shaped 18k white gold pendant. It’s playful and luxurious.",
  price: 200000,
  category: "Jewelries",
  user_id: User.all.sample.id
)


puts "generating Suits and Dresses.."
Product.create!(
  title: "Tom Ford O’Connor Wool Suit",
  description: "The O’Connor suit by Tom Ford is a tailored masterpiece,
  crafted from fine wool. Its slim fit and sharp lines make it perfect for
  high-profile business meetings.",
  price: 60000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Brioni Bespoke Suit",
  description: "This bespoke suit from Brioni is handcrafted in Italy,
   offering unparalleled luxury and a perfect fit. Ideal for
  weddings and important formal events.",
  price: 150000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Giorgio Armani Classic Tuxedo",
  description: "A timeless black tuxedo by Giorgio Armani, featuring satin lapels and a slim silhouette.
  Perfect for black-tie weddings and gala events.",
  price: 50000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Zegna Trofeo Wool Suit",
  description: "The Trofeo suit from Zegna is made from high-quality wool, offering comfort and elegance.
   It’s a versatile option for both meetings and formal events.",
  price: 45000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Canali Impeccabile Suit",
  description: "The Canali Impeccabile suit is crafted from innovative wool fabric that
  resists wrinkles. Its classic design is suitable for business meetings and events.",
  price: 35000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Hugo Boss Signature Suit",
  description: "This Hugo Boss suit is a refined option with a modern fit, perfect for professional settings.
  Its sleek design makes it a go-to for important meetings.",
  price: 30000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Ralph Lauren Purple Label Tuxedo",
  description: "A luxurious tuxedo from Ralph
  Lauren's Purple Label, featuring peak lapels and a rich velvet jacket.
  Ideal for weddings and evening events.",
  price: 80000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Kiton K-50 Bespoke Suit",
  description: "The Kiton K-50 is a bespoke suit, handcrafted from the finest fabrics.
   With only 50 made each year, it’s a symbol of ultimate luxury for special occasions.",
  price: 300000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Elie Saab Couture Gown",
  description: "This Elie Saab gown is a masterpiece of couture, featuring intricate beadwork and flowing chiffon. Perfect for a bride or a guest at an opulent wedding.",
  price: 400000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Oscar de la Renta Silk Gown",
  description: "A stunning silk gown from Oscar de la Renta, featuring a fitted bodice and a full skirt. Ideal for weddings and formal events.",
  price: 90000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Dior Haute Couture Dress",
  description: " This Dior dress is a piece of haute couture, with exquisite craftsmanship and luxurious fabrics. Perfect for the most exclusive events.",
  price: 500000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Valentino Red Evening Gown",
  description: "A bold red gown from Valentino, featuring a classic silhouette and luxurious silk fabric. Ideal for making a statement at weddings or galas.",
  price: 80000,
  category: "Suits & Dresses",
  user_id: User.all.sample.id
)
Product.create!(
  title: "Chanel Little Black Dress",
  description: "The iconic little black dress by Chanel is a timeless piece, perfect for business events and cocktail parties. Its classic design ensures elegance.",
  price: 60000,
  category: "Suits & Dresses",
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


# puts "generating 10 Renting_request models..."
# STATUS = ["pending", "rejected", "accepted"]
# renting_duration = rand(10)
# 10.times do
#   start_date = Date.today
#   renting_request = RentingRequest.new(
#     start_date: "#{start_date}",
#     end_date: "#{start_date + renting_duration}",
#     status: STATUS.sample
#   )
#   user = User.all.sample
#   product = Product.all.sample
#   renting_request.user_id = user.id
#   renting_request.product_id = product.id
#   renting_request.total_price = product.price * renting_duration
#   renting_request.save
# end

puts "generating 16 Review models..."
16.times do
  review = Review.new(
    content: ["The attention to detail is unparalleled. This feels luxurious, and the product is impeccable. I received numerous compliments at the event, and it fit like a glove.",
    "made me feel like a princess. This is exquisite, and the fabric flows beautifully. Perfect for a wedding or any special occasion.",
    "I rented this for a gala, and it was the best decision I made. That was stunning, and I felt confident and elegant all night. The rental process was seamless too.",
    "I couldn’t be happier with this rental. The product was comfortable, stylish, and made me feel like a million dollars. It’s perfect for any black-tie event.",
    "The article was worth every yen. The craftsmanship is evident in every stitch, and the fit was tailored to perfection. I felt confident and stylish throughout the event.",
    "confident and sophisticated. impeccable, and the design is timeless. It’s a must-have for anyone who values quality.",
    "This is the epitome of luxury. It’s perfect for weekend getaways.",
    "this is pure luxury !! I recommend",
    "I don't what to say.. Just thank you for sharing this beautiful product with us",
    "Excellent !"].sample,
    rating: rand(4..5)
  )
  user = User.all.sample
  product = Product.all.sample
  review.user_id = user.id
  review.product_id = product.id
  review.save
end
