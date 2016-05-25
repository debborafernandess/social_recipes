FactoryGirl.define do
  factory :cuisine do |f|
    f.sequence(:description) { |n| "#{n} #{Faker::Name.title}" }
  end
end
