
class User < ActiveRecord::Base

  cattr_reader :page
  @@page = 5



  has_many :albums, :dependent => :destroy
  has_many :comments, :dependent => :destroy 
  has_many :photos, :through => :comments 
  has_many :likes, :as => :likedto_id , :dependent => :destroy
	has_many :problems
  has_many :solutions  
	has_attached_file :user_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :profile => "150x150>", :comment_pic => "80x80>" }, :default_url => '/images/user_d.jpeg'

  
  validates :login_name, :presence => { :message => " is required" } 
	validates :login_password, :confirmation => true
  validates :login_password_confirmation, :presence => true 
  validates :first_name, :presence => { :message => " is required" }
  validates :last_name, :presence => { :message => " is required" }
 # validates_presence_of :date_of_birth, :unless => Proc.new { |user| user.date_of_birth <= Time.now}, :messgae=>" is reqired"

  validates :login_role, :presence => { :message => " is required" }
  validates :email_id, :presence => { :message => " is required" }

  validates :login_name, :uniqueness => { :message => " is already register" }
  validates :email_id, :uniqueness => { :message => " is already register" }

  def name
    first_name + ' ' + last_name
  end 

  def self.admin?(user)
    user.login_role.to_s.downcase == 'admin'
  end

  def self.home_url(user)
    return "/home/home_page" if user.blank?
    case user.login_role.to_s.downcase
      when "admin"
        "/users/admin"
      when "employee"
        "/users/employee"
      end
    end
end
