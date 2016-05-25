FactoryGirl.define do
  factory :recipe do
    name Faker::Name.title
    cuisine Faker::Name.name
    food_type Faker::Name.name
    food_preference Faker::Name.name
    serves 1
    cook_time 1
    level 'Fácil'
    ingredients Faker::Lorem.sentence(2, true)
    directions Faker::Lorem.paragraph(4, true, 4)
  end
end
