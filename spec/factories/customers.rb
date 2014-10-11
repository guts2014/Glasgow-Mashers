# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name {Faker::Name.name}
    trait "Perfectionist"
    affluence 10
    staff_id 1
  end
end
