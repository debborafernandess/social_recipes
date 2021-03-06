FactoryGirl.define do
  factory :recipe do
    name Faker::Name.title
    cuisine
    dish
    preference
    serves 1
    cook_time 1
    level 'Fácil'
    ingredients Faker::Lorem.sentence(2, true)
    directions Faker::Lorem.paragraph(4, true, 4)
    after :create do |recipe|
      recipe.update_column(:photo, File.join(Rails.root,
                                             'spec',
                                             'support',
                                             'cooking.jpg'))
    end
  end
end
