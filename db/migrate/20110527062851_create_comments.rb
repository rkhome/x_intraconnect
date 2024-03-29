class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment_name
      t.date :comment_date
      t.references :photo
      t.references :user

      t.timestamps
    end
    add_index :comments, :photo_id
    add_index :comments, :user_id
  end
  def self.down
    drop_table :comments
  end
end
