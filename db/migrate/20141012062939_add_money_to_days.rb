class AddMoneyToDays < ActiveRecord::Migration
  def change
  	add_column :days, :money, :integer
  end
end
