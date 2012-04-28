class Problem < ActiveRecord::Base
	belongs_to :users
	has_many :solutions
	validates :title, :presence => { :message => " is required" }
	validates :description, :presence => { :message => " is required" }
end
