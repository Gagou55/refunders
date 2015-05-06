# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "You need to have an user created, check it first."

puts "Deleting old records..."
Company.destroy_all
Kind.destroy_all
Sector.destroy_all
Announce.destroy_all

puts "Creating sectors..."
Sector.create(name: "Agroalimentaire")
Sector.create(name: "Automobile")
Sector.create(name: "Bâtiment")
Sector.create(name: "Chimie")
Sector.create(name: "Cosmétique")
Sector.create(name: "Electronique")
Sector.create(name: "Finance")
Sector.create(name: "High-Tech")
Sector.create(name: "Luxe")
Sector.create(name: "Pharmacie")
Sector.create(name: "Publicité")
Sector.create(name: "Santé")
Sector.create(name: "Transport")

puts "Creating kinds..."
Kind.create(name: "Actions")
Kind.create(name: "Obligations")

puts "Creating companies..."
10.times do
  company = Company.new({
    name: Faker::Company.name,
    summary: Faker::Lorem.sentence(3),
    general_information: Faker::Lorem.sentence(3),
    business_model: Faker::Lorem.sentence(3),
    development: Faker::Lorem.sentence(3),
    vision: Faker::Lorem.sentence(3),
    swot: Faker::Lorem.sentence(3),
    team: Faker::Lorem.sentence(3),
    sector_id: Sector.all.sample.id,
    logo: Faker::Avatar.image("my-own-slug", "50x50"),
  })
  company.save
end

puts "Creating announces..."
10.times do
  announce = Announce.new({
    title: Faker::Lorem.sentence(3),
    sku: SecureRandom.uuid,
    price: rand(10..200),
    number_of_share: rand(10..200),
    reason: Faker::Lorem.sentence(3),
    published: random_boolean = true,
    company_id: Company.all.sample.id,
    kind_id: Kind.all.sample.id,
    user_id: User.all.sample.id,
  })
  announce.save
end

puts "Done !"

