class DaysController < ApplicationController
	def index
		@days = current_user.days.all

		render :json => @days
	end

	def create
		if Day.last.nil?
			last_day_nubmer = 0
		else
			last_day_nubmer = Day.last.day_number
		end 

		user = current_user #ManagerDescriptor
		manager_descriptor = ManagerDescriptor.new(user.email, user.email)
		manager_descriptor.money = current_user.money

		# These two are arrays
		staff_descriptor    = staff_description
		customer_descriptor = Array.new
		
		staff_descriptor.each do |staff_member|
			manager_descriptor.hire staff_member

			customers = current_user.staffs.find(staff_member.id).customers

			customers.each do |cust|
				staff_member.add_customer( turn_customer_model_to_descriptor(cust) )
			end

			customer_descriptor += staff_member.customers
		end

		# To be added in database
		money    = manager_descriptor.money
		current_user.update(money: money)

		expenses = manager_descriptor.expenses
		income   = manager_descriptor.income

		# Update staff performance in database
		total_happiness = 0
		total_performance = 0

		staff_descriptor.each do |st|
			performance = st.evaluate
			happiness  = st.happiness
			total_happiness += happiness
			total_performance += performance

			this_staff_member = Staff.find(st.id)
			this_staff_member.happiness   = happiness
			this_staff_member.performance = performance

			this_staff_member.save
		end

		staff_descriptor.each do |st| 
			current_user.staffs.find(st.id).delete if st.leave?
		end

		@day = Day.new(
			day_number:           last_day_nubmer + 1,
			average_staff_happiness:    total_happiness / staff_descriptor.length,
			average_productivity: total_performance / staff_descriptor.length,
			income:               income,
			expenses:             expenses,
			money:                money,
			user_id:              user.id

			)

		if @day.save
			redirect_to root_path
		else
			redirect_to root_path

		end
	end


	def staff_description
		staff_descriptor = Array.new
		traits = Trait.initialize_traits
		current_user.staffs.each do |t|
			staff_member = StaffDescriptor.new(t.id)
			staff_member.name        = t.name
			staff_member.happiness   = t.happiness
			staff_member.salary      = t.salary
			staff_member.basePerformance = t.base_performance
			staff_member.performance = t.performance
			# Iteraateee

			traits.each do |tr|

				staff_member.trait = tr[1] if tr[0] == t.trait_id
			end

			staff_descriptor << staff_member



		end
		return staff_descriptor
	end

	def customer_description
		customer_descriptor = Array.new
		traits = Trait.initialize_traits
		user.customers.each do |t|
			customer_member = CustomerDescriptor.new(t.id)
			customer_member.name      = t.name
			customer_member.affluence = t.affluence
			# iterateee
			traits.each do |tr|
				customer_member.trait = tr[1] if tr.name[0] == t.trait
			end

			customer_descriptor << customer_member
		end
		return customer_descriptor
	end

	def turn_staff_model_to_descriptor(staff_model)
		traits = initialize_traits

		staff_descriptor             = StaffDescriptor.new(staff_model.id)
		staff_descriptor.name        = staff_model.name
		staff_descriptor.happiness   = staff_model.happiness
		staff_descriptor.salary      = staff_model.salary
		staff_description.basePerformance = staff_model.base_performance
		staff_descriptor.performance = staff_model.performance

		# Iteraateee
		traits.each do |tr|
			staff_descriptor.trait = tr if tr.name == staff_model.trait_id
		end


		return staff_descriptor
	end


	def turn_customer_model_to_descriptor(customer_model)
		traits = Trait.initialize_traits

		customer_desc            = CustomerDescriptor.new(customer_model.id)
		customer_desc.name        = customer_model.name
		customer_desc.affluence   = customer_model.affluence

		# Iteraateee
		traits.each do |tr|
			customer_desc.trait = tr[1] if tr[0] == customer_model.trait
		end

		return customer_desc
	end

end
