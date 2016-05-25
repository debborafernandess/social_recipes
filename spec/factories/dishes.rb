FactoryGirl.define do
  factory :dish do |f|
    f.sequence(:description) { |n| "#{n} #{Faker::Name.title}" }
  end
end
