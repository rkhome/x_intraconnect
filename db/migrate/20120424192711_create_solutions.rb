class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
		t.integer :user_id
		t.integer	:problem_id
    t.text :solution
		t.string	:varify
      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
