users = [
  { name: "marina", url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626782776/qxjbfihftnyi9phgnb3l.jpg'},
  { name: "valentin", url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1626805000/yppphiokhswqo7b4ar1b.jpg'},
  { name: "stan", url: 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1625037044/xyvhwprahklgd6nke6rd.jpg'},
  { name: "ruy", url:  'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1627363623/dxcvc5uqkimpnpkhgswe.jpg'},
  { name: "tom", url: 'https://ca.slack-edge.com/T02NE0241-U023WEBMKL1-d07aae573ed8-512'}
]

# create users if they dont exist yet
users.each do |user|
  file = URI.open(user[:url])
  puts "creating #{user[:name]}"
  user = User.new(
    nickname: user[:name],
    email: "#{user[:name]}@vrem.com",
    password: '123456',
    password_confirmation: '123456'
  )
  user.profile_picture.attach(io: file, filename: 'profile_picture.png', content_type: 'image/png')
  user.save!
end
