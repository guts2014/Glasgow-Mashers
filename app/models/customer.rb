class Customer < ActiveRecord::Base
	validates :name, presence: true
	validates :trait, presence: true
	validate  :affluence_not_negative


	def affluence_not_negative
		if affluence.present? && affluence < 1
			errors.add(:affluence, "cannot have negative affluence")
		end
	end
end
