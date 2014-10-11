class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.integer :happiness
      t.integer :salary
      t.integer :performance
      t.integer :trait

      t.timestamps
    end
  end
end
