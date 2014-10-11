class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string  :name
      t.integer :modifier

      t.timestamps
    end
  end
end
