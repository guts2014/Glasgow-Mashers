class Day < ActiveRecord::Base
	validates :day_number,              presence: true
	validates :average_staff_happiness, presence: true
	validates :average_productivity,    presence: true
	validates :income,                  presence: true
	validates :expenses,                presence: true
	belongs_to :user
end
