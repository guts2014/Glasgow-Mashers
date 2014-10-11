# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |t|
  Staff.create(
	name:        Faker::Name.name,
	happiness:   Faker::Number.number(2),
    salary:      Faker::Number.number(5),
    performance: Faker::Number.number(2),
    trait_id:    Faker::Lorem.word
	)
end

