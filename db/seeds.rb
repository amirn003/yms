# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying Yachts...'
Yacht.destroy_all

puts 'Creating Yachts...'

10.times do
  yacht = Yacht.new(
    name: Faker::Name.name,
    number_of_guests: rand(1..10),
    price: (100..9999).to_a.sample,
    location: ['Barcelona', 'Marseille', 'Tunis', 'Nice', 'Athenes', 'Rhodes', 'Le Caire'].sample, #[Faker::Address.city],
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude,
    user_id: rand(1..2)
  )
  yacht.save!
end

puts 'Finished!'
