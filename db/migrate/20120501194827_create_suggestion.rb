class CreateSuggestion < ActiveRecord::Migration
  def self.up
    create_table :suggestions do |t|
      t.integer :user_id
      t.text :suggestion
      t.date :ed_date
      
      t.timestamps 
   end
	end   
  def self.down
    drop_table :suggestions
  end  
end
