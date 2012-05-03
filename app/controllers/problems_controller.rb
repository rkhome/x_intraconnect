class ProblemsController < ApplicationController
before_filter :require_user
	def new
	end

	def create
	
		title = params[:problem][:title]
		description = params[:problem][:description]
		problem = Problem.new()
		problem.title = title
		problem.description = description
		problem.user_id = current_user.id	
		if(problem.save())
			flash[:notice] = "Successful posted"
			redirect_to new_problem_path
		else
			flash[:error] = "Can't post, Try again!"
			render :controller=>"problems", :action=>"new"
		end
	end
end
