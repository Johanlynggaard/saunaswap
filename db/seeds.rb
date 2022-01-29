# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sauna.destroy_all


puts "Creating Users"
user_1 = User.create!(name: "Johan", email: "mipix@getairmail.com", password: "Frog123")
user_2 = User.create!(name: "Carlos", email: "hasofic@getnada.com", password: "Frog123")
user_3 = User.create!(name: "Chris", email: "rujyq@zetmail.com", password: "Frog123")
user_4 = User.create!(name: "Nik", email: "miqifigyt@vomoto.com", password: "Frog123")
puts "Users created!"

puts "Creating Saunas"

swedish = Sauna.new(title: "Amazing Swedish Sauna",
   address: "Stockholm, SE",
   price: "1000",
   capacity: 4,
   image_url: "https://unsplash.com/photos/a-0Qsar9rBg",
   description: "This is so hot!",
   sauna_type: "Swedish",
   user_id: user_1.id
  )

  swedish.save!

  finnish =  Sauna.new(title: "Mediocre Finnish Sauna",
   address: "Oulu, FI",
   price: "800",
   capacity: 2,
   image_url: "https://unsplash.com/photos/a-0Qsar9rBg",
   description: "This is warm :(",
   sauna_type: "Finnish",
   user_id: user_2.id
  )

  finnish.save!

  turkish = Sauna.new(title: "Turkish Sauna",
   address: "Istanbul, Turkey",
   price: "200",
   capacity: 6,
   image_url: "https://unsplash.com/photos/a-0Qsar9rBg",
   description: "Oriental sauna",
   sauna_type: "Turkish",
   user_id: user_3.id
  )

  turkish.save!

puts "Created Saunas"
