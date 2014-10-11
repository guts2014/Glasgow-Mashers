class StaffsController < ApplicationController
	def index
		@staff = Staff.all
	end

	def show
		@staff = Staff.find(params[:id])
	end

	def new_staff
		@customers = Staff.all
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
		page_count = Staff.count / 5;
		@staffs << page_count
		render :json => @staffs
	end


end
