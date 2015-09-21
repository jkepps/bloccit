include RandomData


# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

# Create a unique post
Post.find_or_create_by(title: "This is my unique title", body: "This is my unique body")

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create a unique comment
Comment.find_or_create_by(post: posts.find_by(title: "This is my unique title"), body: "This is my unique comment")


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
