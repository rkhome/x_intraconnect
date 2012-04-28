class AddLikeToTables < ActiveRecord::Migration
   def self.up
    add_column :photos, :likes_count, :integer , :default => 0
    add_column :albums, :likes_count, :integer , :default => 0
    add_column :comments, :likes_count, :integer , :default => 0
  end
	def self.down
		remove_column :photos, :likes_count
    remove_column :albums, :likes_count
    remove_column :comments, :likes_count
	end
end
