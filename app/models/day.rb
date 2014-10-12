class Day < ActiveRecord::Base
	verifies :day_number,              presence: true
	verifies :average_staff_happiness, presence: true
	verifies :average_productivity,    presence: true
	verifies :income,                  presence: true
	verifies :expenses,                presence: true
	belongs_to :user
end
