class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login_name
      t.string :login_password
      t.string :first_name
      t.string :last_name
      t.string :login_role
      t.string :email_id

      t.timestamps
    end
  end
  def self.down
    drop_table :users
  end
end
