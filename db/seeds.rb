# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Destroying Incomes...'
Income.destroy_all
puts 'Destroying Bookings...'
Booking.destroy_all
puts 'Destroying Yachts...'
Yacht.destroy_all
puts 'Destroying Users...'
User.destroy_all



puts 'Creating Users...'
user1 = User.new(username: "jack", email: "jack@sparrow.com", crew: "Caribbean Sea Cie", password:"123456")
user2 = User.new(username: "elizabeth", email: "elizabeth@swann.com", crew: "Caribbean Sea Cie" , password:"123456")
user3 = User.new(username: "william", email: "william@turner.com", crew: "Caribbean Sea Cie" , password:"123456")
user1.save!
user2.save!
user3.save!

puts 'Creating Yachts...'
puts 'Creating Bookings...'
puts 'Creating Incomes...'

50.times do

  yacht = Yacht.create(
    name: Faker::Name.name,
    number_of_guests: rand(1..10),
    price: (50..500).to_a.sample,
    location: ['Barcelona', 'Marseille', 'Tunis', 'Nice', 'Athenes', 'Rhodes', 'Le Caire'].sample,
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude,
    user_id: [user1.id, user2.id, user3.id].sample
  )

  if yacht.user_id == user1.id
    booking = Booking.create(
      check_in: Faker::Date.between(from: '2023-07-19', to: '2023-08-19'),
      check_out: Faker::Date.between(from: '2023-08-20', to: '2023-09-20'),
      agency: Faker::Name.name,
      user_id: user1.id,
      yacht_id: yacht.id
    )
    amount = booking.yacht.price * (booking.check_out - booking.check_in).to_i
    Income.create(amount: amount, date: booking.check_out, booking_id: booking.id, user_id: user1.id)
  end
end

puts 'Finished!'
