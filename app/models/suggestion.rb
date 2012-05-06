class Suggestion < ActiveRecord::Base
validates :suggestion, :presence => { :message => " is required" } 
	belongs_to :users
end
