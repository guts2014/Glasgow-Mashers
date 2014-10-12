# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


=begin
10.times do |t|
  Staff.create(
	name:        Faker::Name.last_name,
	happiness:   Faker::Number.number(2),
    salary:      Faker::Number.number(5),
    performance: Faker::Number.number(2),
    trait_id:    Faker::Lorem.word,
    user_id:     1
	)
end

20.times do |t|
	Customer.create(
		name:      Faker::Name.last_name,
		affluence: Faker::Number.number(4),
		trait:     Faker::Lorem.word,
		staff_id:  rand(10) + 1
		) 
end
=end

