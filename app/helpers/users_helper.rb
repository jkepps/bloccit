module UsersHelper
	def has_no_posts_or_comments?(user)
		user.posts.empty? && user.comments.empty?
	end
end
