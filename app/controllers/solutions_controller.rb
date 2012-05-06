class SolutionsController < ApplicationController
#before_filter :require_user
	def search_solutions
		@problems = Problem.find(:all).paginate(:page=>params[:page],:per_page=>3)
		@solution = Solution.new()
	end
	
	def create_solution
	
	solution_ob = Solution.new
		solution_ob.user_id = current_user.id
		solution_ob.problem_id = params["hidden_problem_id"]
		solution_ob.solution = params["solution"]
		
		solution_ob.varify = ""
		if(solution_ob.save)
			flash[:notice]="Sucecssful posted"
			redirect_to search_solutions_solutions_path
		else
			flash[:notice]="Fail post"
			redirect_to search_solutions_solutions_path
		end
	end
	
	def solutions   
		session[:current_user] = User.find(params["c_u"])
		@problem=Problem.find(params["problem_id"])
		@solutions = @problem.solutions
		render :partial=>'solution', :layout=>false
	end
	
	def verify	
		sol = Solution.find_by_id(params[:id])
		sol.update_attribute(:varify,"verify")
		redirect_to search_solutions_solutions_path
		flash[:notice]="Verified Solution"
	end
	
	def reject	
		sol = Solution.find_by_id(params[:id])
		sol.update_attribute(:varify,"reject")
		redirect_to search_solutions_solutions_path
		flash[:notice]="Rejected Solution"
	end
	
	def search
		search_value = "%#{params[:txt_search]}%"
		search_result = Problem.where("title like ? or description like ?", search_value, search_value) rescue []
		@problems = search_result.paginate(:page=>params[:page],:per_page=>3)
		@solution = Solution.new()
		flash[:notice]="Yehh! you have found matching results..."
		flash[:notice]="Sorry! No result is found." if @problems.blank?
		render 'search_solutions'
	end

end
