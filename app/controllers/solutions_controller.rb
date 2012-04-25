class SolutionsController < ApplicationController

	def search_solutions
		@problems = Problem.find(:all).paginate(:page=>params[:page],:per_page=>6)
		@solution = Solution.new()
	end
	
	def create_solution
	end
	
	def solutions
		@problem=Problem.find(params["problem_id"])
		@solution = @problem.solutions
		render :partial=>'solution'
		
	end

end
