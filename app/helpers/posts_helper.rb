module PostsHelper
	def user_is_authorized_for_post_edit?(post)
		current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
	end

	def user_is_authorized_for_post_destroy?(post)
		current_user && (current_user == post.user || current_user.admin?)
	end
end
