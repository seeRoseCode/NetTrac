# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
businesses = ["Apple", "Google", "Uber", "Lyft", "Chick Fil A", "SalesLoft", ]

10.times do
  user = User.create({
    name: Faker::Name.name
  })
  network = Network.create({
    user_id: user.id
  })
  10.times do
    name = Faker::Name.name
    username = name.gsub(/\s+/, "")
    Contact.create({
      name: name,
      title: Faker::Company.profession,
      business: Faker::Company.name,
      phone_number: Faker::Number.number, #returns a random 10 digit number.
      email_address: "#{username}@gmail.com",
      linked_in: "www.linkedin.com/#{username}",
      twitter: "www.twitter.com/#{username}",
      website: "www.#{username}",
      network_id: network.id
    })
  end

end
