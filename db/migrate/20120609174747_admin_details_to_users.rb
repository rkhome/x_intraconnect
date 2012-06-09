class AdminDetailsToUsers < ActiveRecord::Migration
  def self.up
    User.create(:login_name=> "admin", :login_password=> "123456789$intraconnect", :first_name=> "admin", :last_name=> "admin",  :login_role=> "admin", :email_id=> "parasharragh@gmail.com", :mobile_no=> "9981183726", :date_of_birth=> "2000-01-01 00:00:00",:login_password_confirmation=> "123456789$intraconnect")
  end

  def self.down
    User.where(:login_name =>'admin').first.destroy
  end
end
