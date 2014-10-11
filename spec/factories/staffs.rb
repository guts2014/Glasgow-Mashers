# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :staff do
    name {Faker::Name.name}
    happiness 1
    salary 1000
    performance 1
  	trait_id "Perfectionist"  
  end
end
