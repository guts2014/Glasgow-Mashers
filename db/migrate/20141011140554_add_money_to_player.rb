class AddMoneyToPlayer < ActiveRecord::Migration
  def change
  	change_table :players do |t|
      t.integer :money
      t.string  :name
      t.integer :base_income
    end

  end
end
