FactoryGirl.define do
  factory :preference do
    sequence(:description) { |n| "#{n} #{Faker::Name.title}" }
  end
end
