class Recipe < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :dish

  validates :name, :cuisine, :directions, :dish, :food_preference,
            :ingredients, presence: true

  mount_uploader :photo, ImageUploader
end
