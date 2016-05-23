class Recipe < ActiveRecord::Base
  validates :name, :cuisine, :directions, :food_preference, :food_type,
            :ingredients, presence: true
end
