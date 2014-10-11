class TraitLike < ActiveRecord::Base
  has_many :traits, foreign_key: "who_likes"
  has_many :traits, foreign_key: "what_likes"
end