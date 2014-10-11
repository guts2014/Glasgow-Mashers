class LoggedInController < ApplicationController
	def user_log_in
		@staffs = Staff.pagination(0,5)
		@customers = Customer.pagination(0,5)
	end
end
