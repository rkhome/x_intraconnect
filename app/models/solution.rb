class Solution < ActiveRecord::Base
	belongs_to :problems
	belongs_to :users
	validates :solution, :presence => { :message => " is required" }
  has_many :likes, :as => :likedto, :dependent => :destroy
end
