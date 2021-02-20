# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Removing old customers, brands, product files and matches"

CustomerDatum.destroy_all
ProductSize.destroy_all
Product.destroy_all
Brand.destroy_all
User.destroy_all

#Customer_product_match.destroy_all


puts "Adding some Customers & products :)"



puts "Creating a user :)"

User.create!(
    email: "cydnie@mail.com",
    password: "123456"
)

puts "Adding some Brands :)"

Brand.create!(
    user: User.first,
    name: 'FirstBrand'
)
puts "Creating a brand :)"
Brand.create!(
    user: User.first,
    name: 'SecondBrand'
)

CustomerDatum.create!(
    user: User.first,
    age: 20,
    height: 170,
    weight:  60,

    body_shape: 1
)
puts "Creating a product :)"
Product.create!(
    brand: Brand.first,
    name: "Nice blue sweater",
    fabric_type: "jersey",
    garment_type:  "sweater",
)

ProductSize.create!(
    product: Product.first,
    size_name: "Medium",
    hip_measurement: 90,
    bust_measurement: 90,
    waist_measurement:60,
    length_measurement:80
  )
ProductSize.create!(
    product: Product.first,
    size_name: "Large",
    hip_measurement: 100,
    bust_measurement: 100,
    waist_measurement:70,
    length_measurement:90
  )
