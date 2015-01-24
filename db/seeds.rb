require 'faker'

#create users
10.times do 
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
  user.save!  
end
users=User.all


# create topics
10.times do
    Topic.create(
    name: Faker::Name.name,
    )
  end
  topics= Topic.all

# create bookmarks
30.times do 
    Bookmark.create(
    name: Faker::Name.name,
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample
    )
  end
  bookmarks = Bookmark.all


#create admin
admin = User.new(
  name: 'admin',
  email: 'admin@example.com',
  password: 'helloworld'
)
admin.save

puts 'Seed Finished'
puts "#{users.count} users created"
puts "#{topics.count} topics created"
puts "#{bookmarks.count} bookmarks created"