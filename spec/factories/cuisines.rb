FactoryGirl.define do
  factory :cuisine do
    sequence(:description) { |n| "#{n} #{Faker::Name.title}" }
  end
end
