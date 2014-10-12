class StaffsController < ApplicationController
	def index
		@staff = current_user.staffs.all
	end

	def show
		@staff = current_user.staffs.find(params[:id])
	end

	def new_staff
		@customers = current_user.staffs.all
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
		@staffs = current_user.staffs.pagination(page_num, 5)
		page_count = current_user.staffs.count / 5;
		@staffs << page_count
		render :json => @staffs
	end

	private 
	def person_params
      params.require(:staff).permit(:hainess, :performance, :salary)
    end



end
