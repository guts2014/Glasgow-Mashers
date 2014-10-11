class StaffsController < ApplicationController
	def index
		@staffs = Staff.pagination(0,5)
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

	def next_page
		page_num = params[:page].to_i
		@staffs = Staff.pagination(page_num, 5)
		#staff_count = Staff.count
		render :json => @staffs
	end
end
