class AddDetailsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :mobile_no, :string
    add_column :users, :phone_no, :string
    add_column :users, :permanent_address, :string
    add_column :users, :local_address, :string
    add_column :users, :city, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :user_image_file_name, :string
  end

  def self.down
    remove_column :users, :user_image_file_name
    remove_column :users, :date_of_birth
    remove_column :users, :city
    remove_column :users, :local_address
    remove_column :users, :permanent_address
    remove_column :users, :phone_no
    remove_column :users, :mobile_no
  end
end
