class Recipe < ActiveRecord::Base
  belongs_to :cuisine

  validates :name, :cuisine, :directions, :food_preference, :food_type,
            :ingredients, presence: true

  mount_uploader :photo, ImageUploader
end
