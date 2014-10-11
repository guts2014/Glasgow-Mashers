class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :trait
      t.integer :affluence
      t.integer :staff_id

      t.timestamps
    end
  end
end
