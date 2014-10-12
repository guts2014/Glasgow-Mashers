class Customer < ActiveRecord::Base
	validates :name, presence: true
	validates :trait, presence: true
	validate  :affluence_not_negative
	belongs_to :staff
	


	def affluence_not_negative
		if affluence.present? && affluence < 1
			errors.add(:affluence, "cannot have negative affluence")
		end
	end

	def self.pagination(page_number, number_records)
		all.offset(page_number * number_records).limit(number_records)
	end
end
