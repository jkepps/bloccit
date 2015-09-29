class Rating < ActiveRecord::Base
	enum severity: [ :PG, :PG13, :R ]

	belongs_to :rateable, polymorphic: true
	has_many :topics, source: :rateable, source_type: :Topic
	has_many :posts, source: :rateable, source_type: :Post

	def self.update_rating(rating_string)
		new_ratings = []
		unless rating_string.nil? || rating_string.empty?
			rating_string.split(",").each do |rating|
				new_rating = rating.strip
				new_ratings << new_rating.to_sym
			end
		end
		new_ratings
	end
end
