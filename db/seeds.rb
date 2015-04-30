# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# 10.times do
#   company = Company.new({
#     name: Faker::Company.name,
#     summary: Faker::Lorem.sentence(3),
#     general_information: Faker::Lorem.sentence(3),
#     business_model: Faker::Lorem.sentence(3),
#     development: Faker::Lorem.sentence(3),
#     vision: Faker::Lorem.sentence(3),
#     swot: Faker::Lorem.sentence(3),
#     team: Faker::Lorem.sentence(3),
#     sector_id: rand(Sector.count),
#     logo: Faker::Avatar.image("my-own-slug", "50x50"),
#   })
#   company.save
# end

10.times do
  announce = Announce.new({
    title: Faker::Lorem.sentence(3),
    price: rand(10..200),
    number_of_share: rand(10..200),
    reason: Faker::Lorem.sentence(3),
    published: random_boolean = [true, false].sample,
    company_id: rand(52..60),
    user_id: rand(2),
  })
  announce.save
end


# Sector.create(name: "Agroalimentaire")
# Sector.create(name: "Automobile")
# Sector.create(name: "Bâtiment")
# Sector.create(name: "Chimie")
# Sector.create(name: "Cosmétique")
# Sector.create(name: "Electronique")
# Sector.create(name: "Finance")
# Sector.create(name: "High-Tech")
# Sector.create(name: "Luxe")
# Sector.create(name: "Pharmacie")
# Sector.create(name: "Publicité")
# Sector.create(name: "Santé")
# Sector.create(name: "Transport")

# Kind.create(name: "Actions")
# Kind.create(name: "Obligations")

# Company.create(kind: "Actions")
# Company.create(kind: "Obligations")