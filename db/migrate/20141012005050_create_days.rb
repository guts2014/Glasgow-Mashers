class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_number, :default => 1
      t.integer :average_staff_happiness
      t.integer :average_productivity
      t.integer :income
      t.integer :expenses
      t.integer :user_id
      t.timestamps
    end
  end
end
