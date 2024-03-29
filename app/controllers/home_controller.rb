class HomeController < ApplicationController
  def login
    redirect_to User.home_url(current_user) and return unless current_user.blank? 
    render :layout => false
  end

  def logout  
    session[:current_user] = nil
    flash[:notice]="Successfully Loged-Out"
    redirect_to home_page_home_index_path
  end
  def show
   redirect_to :action => 'login'
  end
  def check_login

    password = get_encryp_pass(params[:password])
    user = User.find(:first,:conditions=>[" login_name = ? and login_password = ? ",params[:login],password] )
    if user 
      flash[:notice]="Successfully Loged-In"
      session[:current_user] = user      
      if user.login_role.downcase == "admin" then        
        redirect_to :controller =>'users',:action => 'admin'
      elsif(user.login_role.downcase == "employee") then
      	redirect_to :controller =>'users', :action => 'employee'
      end       
    else
      flash[:error] = "User id or password is incorrect."
      redirect_to :action => 'login'
    end 
  end
end
