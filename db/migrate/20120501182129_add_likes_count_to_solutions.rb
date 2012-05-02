class AddLikesCountToSolutions < ActiveRecord::Migration
  def self.up
    add_column :solutions, :likes_count, :integer , :default => 0
  end

  def self.down
    remove_column :solutions, :likes_count
  end
end
