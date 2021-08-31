names = %w[marina valentin stan ruy tom]

basic_messages = [
  "hi",
  "hey",
  "yo",
  "does anyone have cash?",
  "me",
  "me",
  "cash only",
  "yes",
  "should i bring something else",
  "no",
  "how long will we be there?",
  "should we go to the lake after?"
]

mbp_images = %w[
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630068087/IMG_9805_dwsg7s.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9796_cz8acp.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9806_p3gvti.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9797_hb2d3n.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630068088/IMG_9794_nfjvqp.jpg
]

images = %w[
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067177/restaurant_neni_bikini_berlin_25_hours_hotel_aeacrw.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067177/Download_1_vrnrfz.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067177/gettyimages-1201202312_pil6ip.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067177/1-format43_sddyyk.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067177/GettyImages-1253501415_kbwpm0.jpg
  https://res.cloudinary.com/dluzejx2p/image/upload/v1630067178/berlin-volkspark-hasenheide-102_2400x1350_axp4an.jpg
]

addresses = [
  "Genslerstraße 78, 13055 Berlin",
  "Brandenburgische Str. 110, 10713 Berlin",
  "Leopoldstraße 35, 10317 Berlin",
  "Barbarossastraße 43, 10779 Berlin",
  "Kurfürstenstraße 58, 10785 Berlin",
  "Unter den Linden 21, 10117 Berlin",
  "Ritterstraße 15, 10969 Berlin",
  "Solmsstraße 32, 10961 Berlin",
  "Greifswalder Str. 32, 10405 Berlin",
  "Schönhauser Allee 27, 10435 Berlin"
]

things_to_do = [
 "Lets get Breakfast",
 "Eat Lunch",
 "Grab Dinner",
 "Watch a Movie",
 "Go to the Park",
 "Guy's Birthday Party",
 "Girls's Birthday Party",
 "House Party",
 "Batch party",
 "Chill at the lake"
]

months = ["07", "08", "09"]

# create users if they dont exist yet
users = []
if User.last.nil?
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
else
  puts "Users already exist"
  users = User.all
end

#profile_picture
file1 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626782776/qxjbfihftnyi9phgnb3l.jpg')
file2 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626805000/yppphiokhswqo7b4ar1b.jpg')
file3 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1625037044/xyvhwprahklgd6nke6rd.jpg')
file4 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1627363623/dxcvc5uqkimpnpkhgswe.jpg')
file6 = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1625037044/xyvhwprahklgd6nke6rd.jpg')
users[0].profile_picture.attach(io: file1, filename: 'profile_picture.png', content_type: 'image/png')
users[0].save!
users[1].profile_picture.attach(io: file2, filename: 'profile_picture.png', content_type: 'image/png')
users[1].save!
users[2].profile_picture.attach(io: file3, filename: 'profile_picture.png', content_type: 'image/png')
users[2].save!
users[3].profile_picture.attach(io: file4, filename: 'profile_picture.png', content_type: 'image/png')
users[3].save!
users[4].profile_picture.attach(io: file6, filename: 'profile_picture.png', content_type: 'image/png')
users[4].save!

# custom events
baf = {
  name: "Breakfast at Filipes",
  description: "Lets eat that good brazilian food.",
  location: "Falckensteinstraße 35, 10997 Berlin",
  start_time: DateTime.parse("12/09/2021 14:00"),
  end_time: DateTime.parse("12/09/2021 17:00"),
  host: users[0], # marina
  messages: basic_messages
}

baf2 = {
  name: "Breakfast at Marianas",
  description: "Lets eat that good chinese food.",
  location: "Hermanstrasse 35, 10997 Berlin",
  start_time: DateTime.parse("12/09/2021 11:00"),
  end_time: DateTime.parse("12/09/2021 12:00"),
  host: users[1], # marina
  messages: basic_messages
}

mbp_e = {
  name: "Mid Batch Party",
  description: "Mid Batch Parteeeeeey Incoming. Hoolaaaa lovely souls. We are extremely looking forward to seeing you for new adventures! You made it to the half of the batch and that deserves a BIG Celebration!",
  location: "Bernauer Str. 63-64, 13355 Berlin",
  start_time: DateTime.parse("30/07/2021 18:30"),
  end_time: DateTime.parse("31/07/2021 02:30"),
  host: users[4], # tom
  messages: basic_messages
}

events = []

# dont create custom events twice
if Event.where(name: "Breakfast at Filipes").length.zero?
  events << baf
end

# random events
addresses.each do |address|
  date = rand(1..29)
  start_day = date < 10 ? date.to_s : "0#{date}"

  date = rand(1..2) == 1 ? date : date + 1
  end_day = date < 10 ? date.to_s : "0#{date}"

  hour = rand(10..18)
  duration = rand(1..6)

  e = {
    name: things_to_do.sample,
    description: "This description sucks...",
    location: address,
    start_time: DateTime.parse("#{start_day}/#{months.sample}/2021 #{hour}:00"),
    end_time: DateTime.parse("#{end_day}/#{months.sample}/2021 #{hour+duration}:00"),
    host: users.sample,
    messages: basic_messages
  }
  events << e
end

events = []
# save events in database
events.each do |event|
  file = URI.open(images.sample)
  puts "creating #{event[:name]}:"
  e = Event.new(
    name:event[:name],
    description: event[:description],
    location: event[:location],
    start_time: event[:start_time],
    end_time: event[:end_time],
    user: event[:host]
  )
  e.image.attach(io: file, filename: 'image1', content_type: 'image/png')
  e.save!

  i = Invitation.new(event: e, user: users[3]) #stan
  rand(1..2) == 1 ? i.accepted! : nil

  puts "\tcreating messages"
  event[:messages].each do |message|
    user = users.sample
    m = Message.new(
      content: message,
      event: e,
      user: user
    )
    m.save!
  end
end

file = URI.open("https://res.cloudinary.com/dluzejx2p/image/upload/v1630069530/partner_20191111191717_jpc4jp.png")

e = Event.new(
    name:mbp_e[:name],
    description: mbp_e[:description],
    location: mbp_e[:location],
    start_time: mbp_e[:start_time],
    end_time: mbp_e[:end_time],
    user: mbp_e[:host]
  )
  e.image.attach(io: file, filename: 'image1', content_type: 'image/png')
  e.save!

  users.take(users.count - 1).each do |user|
    i = Invitation.new(event: e, user: user)
    i.accepted!
  end
