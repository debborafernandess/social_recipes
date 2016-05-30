FactoryGirl.define do
  factory :dish do
    sequence(:description) { |n| "#{n} #{Faker::Name.title}" }
  end
end
