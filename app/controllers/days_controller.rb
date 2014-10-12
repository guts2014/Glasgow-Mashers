class DaysController < ApplicationController
	def create
		last_day_nubmer = Day.last.day_number
		@day = Day.new #data from game engine

	end
end
