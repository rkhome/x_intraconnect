class Problem < ActiveRecord::Base
	belongs_to :users
	has_many :solutions
	validates :title, :presence => { :message => "Title is required" }
	validates :description, :presence => { :message => "Description is required" }
end
