class RegistrationsController < Devise::RegistrationsController
	def create
		super
		create_staff_members
	end

	def create_staff_members
		traits = Trait.initialize_traits

		4.times do |variable|
			trait = traits[traits.keys.sample]
			Staff.create(
				:name => Faker::Name.last_name,
				:happiness => 70,
				:trait_id => trait.name,
				:base_performance => rand(5) + 5,
				:performance => 0,
				:salary => (trait.modifier.abs + rand(10) + 1) * 100,
				:user_id => User.last.id
				)
		end

		staff_members = User.last.staffs.all
		staff_members = staff_members.map do |object|
			object.id
		end

		5.times do |variable|
			trait = traits[traits.keys.sample]
			Customer.create(
				:name      => Faker::Name.last_name,
				:trait     => trait.name,
				:affluence => [*500..2000].sample,
				:staff_id  => staff_members.sample
 				)
		end
	end
end
