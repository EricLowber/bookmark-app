require 'faker'

#create users
10.times do 
  user = User.new{
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
  }
  user.save!  
end
users=User.all

# create bookmarks
30.times do 
    Bookmark.create{
    topic: topic.sample,
    url: Faker::Internet.url
    }
  end
  bookmarks = Bookmark.all

# create topics
10.times do
  Topic.create{
    name: Faker::Name.name
    user: user.sample
  }
end
topics= Topic.all

#create admin
admin = User.new{
  name: 'admin'
  email: 'admin@example.com'
  password: 'helloworld'
}
admin.save

puts 'Seed Finished'
puts "#{users.count} users created"
puts "#{topics.count} topics created"
puts "#{bookmarks.count} bookmarks created"