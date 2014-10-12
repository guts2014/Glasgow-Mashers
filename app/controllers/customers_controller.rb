class CustomersController < ApplicationController
	def index
		@customers = current_user.customers.all
	end

	def show
		@customer = current_user.customers.find(params[:id])
	end


	def next_page
		page_num = params[:page].to_i
		@customers = current_user.customers.pagination(page_num, 5)
		page_count = current_user.customers.count / 5;

		cust_name = Array.new
		@customers.each do |t|
			cust_name.push t.staff.name
		end


		render :json => {:customers => @customers, 
			:customer_names => cust_name,
			:page_count => page_count}
	end

end
