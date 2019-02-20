# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Flat.destroy_all

10.times do
  Flat.create!(
    name: Faker::Movies::LordOfTheRings.location,
    address: Faker::Address.full_address,
    description: Faker::TvShows::SiliconValley.quote,
    price_per_night: [Faker::Number.number(2), Faker::Number.number(3)].sample,
    number_of_guests: Faker::Number.number(1),
    image: Faker::LoremPixel.image("350x260", false, 'city', (1..10).to_a.sample)
  )
end
