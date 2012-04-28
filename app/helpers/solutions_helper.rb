module SolutionsHelper

	def get_user(user_id)
		@user = User.find_by_id(user_id)
		@user_name = @user.first_name+" "+@user.last_name
	  return @user_name
	end

end
