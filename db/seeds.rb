# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
names = %w[marina ruy valentin stan]
names.each do |user|
  puts "creating #{user}"
  user = User.create(
    nickname: user,
    email: "#{user}@vrem.com",
    password: '123456',
    password_confirmation: '123456'
  )
  users << user
end

puts "creating Breakfast at Filipes"
baf = Event.create(
  name: "Breakfast at Filipes",
  description: "Lets eat that good brazilian food.",
  location: "Falckensteinstraße 35, 10997 Berlin",
  start_time: DateTime.parse("09/12/2021 14:00"),
  end_time: DateTime.parse("09/12/2029 17:00"),
  user: marina
)
