class DaysController < ApplicationController
	
	def create
		last_day_nubmer = Day.last.day_number
		user = current_user #ManagerDescriptor
		manager_descriptor = ManagerDescriptor.new(
			:email => user.email,
			:name => ""
			)

		# These two are arrays
		staff_descriptor    = staff_description
		customer_descriptor = Array.new
		
		staff_descriptor.each do |staff_member|
			manager_descriptor.hire staff_member

			customers = current_user.staff.find(staff_member.id).customers

			customers.each do |cust|
				staff_member.add_customer( turn_customer_model_to_descriptor(cust) )
			end

			customer_descriptor += staff_member.customers
		end

		# To be added in database
		money    = manager_descriptor.money
		expenses = manager_descriptor.expenses
		income   = manager_descriptor.income

		# Update staff performance in database
		staff_descriptor.each do |st|
			performance = st.evaluate
			happpiness  = st.happiness

			this_staff_member = Staff.find(st.id)
			this_staff_member.happiness   = happiness
			this_staff_member.performance = performance

			this_staff_member.save
		end

		@day = Day.new #data from game engine

	end


	private 

	def staff_description
		staff_descriptor = Array.new
		traits = initialize_traits
		user.staffs.each do |t|
			staff_member = StaffDescriptor.new(t.id)
			staff_member.name        = t.name
			staff_member.happiness   = t.happiness
			staff_member.salary      = t.salary
			staff_member.performance = t.performance
			# Iteraateee
			traits.each do |tr|
				staff_member.trait = tr if tr.name == t.trait_id
			end

			staff_descriptor << staff_member
		end

		return staff_descriptor
	end

	def customer_description
		customer_descriptor = Array.new
		traits = initialize_traits
		user.customers.each do |t|
			customer_member = CustomerDescriptor.new(t.id)
			customer_member.name      = t.name
			customer_member.affluence = t.affluence
			# iterateee
			traits.each do |tr|
				customer_member.trait = tr if tr.name == t.trait
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
		staff_descriptor.performance = staff_model.performance
			# Iteraateee
			traits.each do |tr|
				staff_descriptor.trait = tr if tr.name == staff_model.trait_id
			end
		end

		return staff_descriptor
	end

	def turn_customer_model_to_descriptor(customer_model)
		traits = initialize_traits

		customer_descriptor             = CustomerDescriptor.new(customer_model.id)
		customer_descriptor.name        = customer_model.name
		customer_descriptor.affluence   = customer_model.affluence

			# Iteraateee
			traits.each do |tr|
				customer_descriptor.trait = tr if tr.name == customer_model.trait
			end
		end

		return customer_descriptor
	end

end
