class ChangeStaffForeignTraitName < ActiveRecord::Migration
  def change
  	rename_column :staffs, :trait, :trait_id
  end
end
