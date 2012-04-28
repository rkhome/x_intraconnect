class EmailerController < ApplicationController
  before_filter :require_user
  layout :set_layout

  def sendmail
   recipient = params["recipient"]
   subject = params["subject"] 
   message = params["message"]
   Emailer.contact(recipient, subject, message).deliver
   return if request.xhr?
     flash[:notice] = "Message has been send successfully"
     redirect_to :controller => 'users' , :action => 'admin'
  end

  def new_email
    @users=User.find(:all, :conditions => ["id != ?", current_user.id])
  end
  
  def employee_email
     user_ids = params["user_ids"]
     subject = params["subject"] 
     message = params["message"]
     if user_ids.blank?
       flash[:error]="Please select mail recipients."       
     elsif subject.blank?
       flash[:error]="Please give mail subject, You can't leave it blank."        
     elsif message.blank?
       flash[:error]="Please write message, You can't leave it blank."        
     else    
       # collect the email ids of recipents in array
       users = User.find(user_ids)   
       recipents_mail_ids=[]
       users.each do | user |
         recipents_mail_ids << user.email_id
       end 
       # created a comma seprated string of email ids.
       recipents_mail_ids.join(", ")
       flash[:notice] = "Email has been send successfully."
       Emailer.deliver_employee_email(current_user.email_id, recipents_mail_ids, subject, message)   
       return if request.xhr?
     end
    redirect_to new_email_emailer_index_path
  end

end
