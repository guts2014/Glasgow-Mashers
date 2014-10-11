class DropClients3 < ActiveRecord::Migration
  def change
  	drop_table :clients
  end
end
