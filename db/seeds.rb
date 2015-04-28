# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

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
    logo: Faker::Avatar.image("my-own-slug", "50x50"),
  })
  company.save
end