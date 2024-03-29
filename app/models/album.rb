class Album < ActiveRecord::Base  
	has_many :likes, :as => :likedto, :dependent => :destroy
  #after_create :send_mail
  belongs_to :user
  has_many :photos ,:dependent => :destroy
  belongs_to :cover_photo, :class_name => "Photo" ,:foreign_key =>'cover_photo_id'
  accepts_nested_attributes_for :photos, :allow_destroy  => true

  validates :album_name, :presence => { :message => " is required" }
  validates :album_description, :presence => { :message => " is required" }

  def is_owner?(user)
    album =  user.albums.find(:first,:conditions=>[" id = ? " , self.id]) 
    album ? true : false 
  end

  def name
    first_name + ' ' + last_name
  end
end


=begin
  def send_mail
    recipients = User.all
    recipients.each do |user|
      if user.name != self.user.name
        Emailer.new_album_email(user, self).deliver
      end
    end
    self.save
  end
=end
