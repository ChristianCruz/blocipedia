# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'password',
   role:     'admin'
 )

charlie = User.new(
   name:     'Charlie Doe',
   email:    'charlie@example.com',
   password: 'password',
   role:     'standard'
 )

ana = User.new(
   name:     'Ana Mary',
   email:    'ana@example.com',
   password: 'password',
   role:     'premium'
 )

25.times do 
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: charlie
    )
end

puts 'Seed successful!'
