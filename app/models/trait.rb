class Trait < ActiveRecord::Base
	belongs_to :trait_like
	belongs_to :trait_hate
end
