module SuggestionsHelper

	def user_name(user_id)
	
		user = User.find_by_id(user_id)
		user.first_name + ' ' + user.last_name
	end
end
