# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
User.destroy_all
Sauna.destroy_all

puts "Creating Users"
user_1 = User.create!(name: "Johan", email: "mipix@getairmail.com", password: "Frog123", has_saunas: true)
user_2 = User.create!(name: "Carlos", email: "hasofic@getnada.com", password: "Frog123", has_saunas: true)
user_3 = User.create!(name: "Chris", email: "rujyq@zetmail.com", password: "Frog123", has_saunas: true)
user_4 = User.create!(name: "Nik", email: "miqifigyt@vomoto.com", password: "Frog123")
puts "Users created!"

puts "Creating Saunas"

swedish = Sauna.new(title: "Amazing Swedish Sauna",
   address: "Stockholm, SE",
   price: "1000",
   capacity: 4,
   image_url: "https://images.unsplash.com/photo-1604609165678-096d20fab1ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80",
   description: "Steamy Swedish Sauna!",
   sauna_type: "Swedish",
   user_id: user_1.id,
  )

  swedish.save!

  finnish =  Sauna.new(title: "Mediocre Finnish Sauna",
   address: "Oulu, FI",
   price: "800",
   capacity: 2,
   image_url: "https://images.unsplash.com/photo-1583416750470-965b2707b355?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80",
   description: "Cosy Finnish Sauna",
   sauna_type: "Finnish",
   user_id: user_2.id,
  )

  finnish.save!

  turkish = Sauna.new(title: "Turkish Sauna",
   address: "Istanbul, Turkey",
   price: "200",
   capacity: 6,
   image_url: "https://images.unsplash.com/photo-1617372607364-f55cb6fa0502?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1065&q=80",
   description: "Oriental sauna",
   sauna_type: "Turkish",
   user_id: user_3.id
  )

  turkish.save!

puts "Created Saunas"

puts "Creating Booking"

booking = Booking.new(
  start_date: "01/042022",
  end_date: "02/04/2022",
  user_id: user_1.id,
  sauna_id: swedish.id
)

booking.save!
puts "Created Booking!"
