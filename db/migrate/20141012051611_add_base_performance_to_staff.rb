class AddBasePerformanceToStaff < ActiveRecord::Migration
  def change
  	add_column :staffs, :base_performance, :integer
  end
end
