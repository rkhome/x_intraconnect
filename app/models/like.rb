class Like < ActiveRecord::Base
  belongs_to :liked_to, :polymorphic => :true
end
