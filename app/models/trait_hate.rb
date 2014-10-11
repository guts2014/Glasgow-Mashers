class TraitHate < ActiveRecord::Base
  has_many :traits, foreign_key: "who_hates"
  has_many :traits, foreign_key: "what_hates"
end