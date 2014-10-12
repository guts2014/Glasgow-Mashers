class Staff < ActiveRecord::Base
	validates   :name, presence: true
	validates   :salary, numericality: {only_integer: true}
	validates   :happiness, numericality: {only_integer: true}
	validates   :salary, numericality: {only_integer: true}
	validates   :performance, numericality: {only_integer: true}
	validates   :trait_id, presence: true
	validate    :happiness_not_negative
	validate    :salary_not_negative
	has_many    :customers
	belongs_to  :user

	def happiness_not_negative 
		if happiness.present? && happiness < 1
			errors.add(:happiness, "cannot have negative happiness")
		end
	end

	def salary_not_negative
		if salary.present? && salary < 1
			errors.add(:salary, "cannot have negative salary")
		end
	end

	def self.pagination(page_number, number_records)
		all.offset(page_number * number_records).limit(number_records)
	end

end
