class LikesTrait < ActiveRecord::Migration
  def change
  	create_table :trait_likes do |t|
      t.string  :who_likes
      t.integer :what_likes

      t.timestamps
    end
  end
end
