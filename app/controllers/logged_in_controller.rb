class LoggedInController < ApplicationController
	def user_log_in
		@staffs = current_user.staffs.pagination(0,5)
		@customers = current_user.customers.pagination(0,5)
	end
end
