require 'digest/sha2'
require 'will_paginate'
class UsersController < ApplicationController
  before_filter :require_user
  layout :set_layout 
  # GET /users
  # GET /users.json
#   layout 'admin_layout' , :except => [:employee , :change_password]
  def admin
    @suggestion = Suggestion.where('ed_date >= ?',Time.now.strftime("%Y-%m-%d")).paginate(:page => params[:page], :per_page => 5)
       
  end

  def employee
    @suggestion = Suggestion.where('ed_date >= ?',Time.now.strftime("%Y-%m-%d")).paginate(:page => params[:page], :per_page => 5)
  end

  def change_password
    
  end

  def index
		set_default_flash       
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json=> @users }
      end   
  end

  # GET /users/1
  # GET /users/1.json
  def show
     @user = User.find(params[:id])
       respond_to do |format|
       format.html # show.html.erb
       format.json { render json=> @user }     
       end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    if current_user.login_role.to_s.downcase == 'admin'
      @user = User.new
        respond_to do |format|
        format.html # new.html.erb
        format.json { render json=> @user }
       end
    else
      flash[:error]="authentication fail !" 
      redirect_to logout_home_index_path
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
      respond_to do |format|
      @user.login_password = get_encryp_pass(@user.login_password)
			@user.login_password_confirmation = get_encryp_pass(@user.login_password_confirmation)
       if @user.save
        flash[:notice]="User successfully created !" 
        format.html { redirect_to :controller =>'users',:action => 'admin'}
        else
          flash[:error]="Please fill all required fields !"
         @user.login_password = nil
				 @user.login_password_confirmation = nil
         format.html { render :action=> "new" }
       end
    end
  end
  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      params[:user][:login_password] = get_encryp_pass(params[:user][:login_password])
			params[:user][:login_password_confirmation] = get_encryp_pass(params[:user][:login_password_confirmation])
      if @user.update_attributes(params[:user])
        flash[:notice]='User detail successfully updated.'
        format.html { redirect_to @user}
      else
        format.html { render :action=> "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user.login_role.to_s.downcase == 'admin'
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]="User successfully deleted ! "
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
    else
       redirect_to logout_home_index_path
    end
  end
 
  def modify_password
    current_password = get_encryp_pass(params[:current_password])
    new_password = get_encryp_pass(params[:new_password])
    @user = User.find(:first, :conditions=>[" login_password = ? and id = ? ", current_password, current_user.id])
      if @user then
        @user.login_password = new_password
        @user.save
        flash[:notice]="Password successfully changed ! "
        if current_user.login_role.to_s.downcase == 'admin'
           redirect_to :action => 'admin'
        else
           redirect_to :action => 'employee'
        end
      else 
        flash[:error] = "You have entered wrong current password. Please try again !"
        redirect_to :action => 'change_password'
      end
   end  
end
