class DestroyClients2 < ActiveRecord::Migration
  def change
  	drop_table :clients
  end
end
