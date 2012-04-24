class Like < ActiveRecord::Base
belongs_to :likedto, :polymorphic => true,:counter_cache => true

end
