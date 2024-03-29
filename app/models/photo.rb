class Photo < ActiveRecord::Base  
  after_create :set_cover_photo
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>",:profile => "150x150>" }, :default_url => '/images/album_cover_d.jpeg'
  belongs_to :album
  has_many :comments
  has_many :users, :through => :comments
  has_many :likes, :as => :likedto

  def set_cover_photo
    unless self.album.cover_photo
      self.album.cover_photo = self
      self.album.save
    end
  end

  def is_owner?(user)
    album =  user.albums.find(:first,:conditions=>[" id = ? " , self.album.id]) 
    album ? true : false 
  end

end
