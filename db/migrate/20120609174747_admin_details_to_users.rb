class AdminDetailsToUsers < ActiveRecord::Migration
  def self.up
    #123456789$intraconnect
    User.create(:login_name=> "admin", :login_password=> "b2ed0337ad12101d2c7d29efe76ccf68", :first_name=> "admin", :last_name=> "admin",  :login_role=> "admin", :email_id=> "parasharragh@gmail.com", :mobile_no=> "9981183726", :date_of_birth=> "2000-01-01 00:00:00",:login_password_confirmation=> "b2ed0337ad12101d2c7d29efe76ccf68")
  end

  def self.down
    User.where(:login_name =>'admin').first.destroy
  end
end
