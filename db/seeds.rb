include RandomData

# Create Users
5.times do
  user = User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

# Create Labels
5.times do
  label = Label.create!(
    name: RandomData.random_word
  )
end
labels = Label.all

# Create Rating
(0..2).each do |n|
  Rating.create!(
    severity: n
  )
end
ratings = Rating.all

# Create Topics
15.times do
  Topic.create!(
  name:         RandomData.random_sentence,
  description:  RandomData.random_paragraph,
  rating_id: ratings.sample.id
  )
end
topics = Topic.all


# Create Posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    rating_id: ratings.sample.id
  )
end
posts = Post.all

50.times do
  posts.sample.labels << labels.sample
  topics.sample.labels << labels.sample
end

# Create Comments
100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create an admin user
admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

# Create a member
member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
