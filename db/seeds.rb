users = []
names = %w[marina ruy valentin stan]
names.each do |user|
  puts "creating #{user}"
  user = User.new(
    nickname: user,
    email: "#{user}@vrem.com",
    password: '123456',
    password_confirmation: '123456'
  )
  user.save!
  users << user
end

puts "creating Breakfast at Filipes"
baf = Event.new(
  name: "Breakfast at Filipes",
  description: "Lets eat that good brazilian food.",
  location: "Falckensteinstraße 35, 10997 Berlin",
  start_time: DateTime.parse("09/12/2021 14:00"),
  end_time: DateTime.parse("09/12/2029 17:00"),
  user: users[0] # marina
)
baf.save!

messages = ["hi", "hey", "yo", "whos coming?", "me", "me", "maybe", "should i bring some beers", "what exactly are we doing and how long will we be there?"]
messages.each do |message|
  Message.new(
    content: message,
    event: baf,
    user: users.sample
  )
  Message.save!
end
