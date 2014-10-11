class ChangeLikesTraitString < ActiveRecord::Migration
  def change
  	change_table :trait_likes do |t|
      t.change :what_likes, :string
   end
  end
end
