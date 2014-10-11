class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def assign_new_staff
		@customers = Customer.all
	end

	def next_page
		page_num = params[:page].to_i
		@customers = Customer.pagination(page_num, 5)
		page_count = Customer.count / 5;

		cust_name = Array.new
		@customers.each do |t|
			cust_name.push t.staff.name
		end

		@customers << page_count


		render :json => {:customers => @customers, 
			:customer_names => cust_name,
			:page_count => page_count}
	end

end
