class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
	has_many :likes, :as => :likedto
end
