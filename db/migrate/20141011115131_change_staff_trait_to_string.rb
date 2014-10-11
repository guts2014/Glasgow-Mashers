class ChangeStaffTraitToString < ActiveRecord::Migration
	def change
		change_table :staffs do |t|
			t.change :trait_id, :string
		end
	end
end
