class AddMoneyAndBaseIncomeToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.integer :money,       default: 5000
      t.integer :base_income, default: 3000
    end
  end
end
