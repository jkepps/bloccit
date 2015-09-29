require 'rails_helper'
include RandomData

RSpec.describe Rating, type: :model do
	let(:rating) { Rating.create!( severity: 'PG') }
	let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph, rating_id: rating.id) }
	let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
	let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user, rating_id: rating.id) }
	let(:rating2) {Rating.create!( severity: 'R') }

	it { should belong_to(:rateable) }
	it { should have_many(:topics) }
	it { should have_many(:posts) }

	describe "rateable" do
		it "allows ratings to be associated with many difference topics and posts" do
			topic_rating = topic.rating
			post_rating = post.rating
			expect(topic_rating).to eql(post_rating)
		end
	end

	describe "attributes" do
		it "should respond to severity" do
			expect(rating).to respond_to(:severity)
		end
	end

	describe ".update_ratings" do
		it "takes a comma delimited string and returns an array of ratings" do
			ratings = "#{rating.severity}, #{rating2.severity}"
			ratings_as_a = [rating.severity.to_s, rating2.severity.to_s]
			expect(Rating.update_rating(ratings)).to eql(ratings_as_a)
		end
	end
end
