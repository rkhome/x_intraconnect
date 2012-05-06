class ProblemsController < ApplicationController
before_filter :require_user
	def new
@problem = Problem.new
	end

	def create
	
		title = params[:problem][:title]
		description = params[:problem][:description]
		@problem = Problem.new()
		@problem.title = title
		@problem.description = description
		@problem.user_id = current_user.id	

		if(@problem.save())
			flash[:notice] = "Successful posted"
			redirect_to new_problem_path
		else
			#flash[:error] = "Title and Description can't be blank "
			render new_problem_path
		end
	end
end
