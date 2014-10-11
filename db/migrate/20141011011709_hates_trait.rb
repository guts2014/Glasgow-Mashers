class HatesTrait < ActiveRecord::Migration
  def change
	create_table :trait_hates do |t|
	  t.string  :who_hates
	  t.string  :what_hates

	  t.timestamps
    end
  end
end
