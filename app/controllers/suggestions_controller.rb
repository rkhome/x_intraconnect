class SuggestionsController < ApplicationController

	def event

	end
	
	def create_event
		
		sugg = Suggestion.new()
		
		sugg.ed_date = params[:date_of_event]["orderdaymonthyear(3i)"]+"-"+params[:date_of_event]["orderdaymonthyear(2i)"]+"-"+params[:date_of_event]["orderdaymonthyear(1i)"]
		sugg.suggestion = params[:event_idea]
		sugg.user_id = current_user.id
		if sugg.save
			flash[:notice] ="Event is created"
			redirect_to admin_users_path if current_user.login_role == "Admin"
			redirect_to employee_users_path if current_user.login_role == "Employee"
		else
			flash[:error] = "Fail to create suggestion"
			redirect_to admin_users_path if current_user.login_role == "Admin"
			redirect_to employee_users_path if current_user.login_role == "Employee"
		end
	end

end
