class ChangeLikedToId < ActiveRecord::Migration
  def self.up
	remove_column :likes, :likedto
	 add_column :likes, :likedto_id, :integer, :default => 0
  end

  def self.down
	remove_column :likes, :likedto_id
	add_column :likes, :likedto, :integer
  end
end
