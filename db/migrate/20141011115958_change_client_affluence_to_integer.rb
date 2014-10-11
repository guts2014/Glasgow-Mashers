class ChangeClientAffluenceToInteger < ActiveRecord::Migration
  def change
  	change_column :clients, :affluence, :integer
  end
end
