class Problem < ActiveRecord::Base
belongs_to :users
has_many :solutions
end
