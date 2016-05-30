class Recipe < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :dish
  belongs_to :preference

  validates :name, :cuisine, :directions, :dish, :preference,
            :ingredients, presence: true

  mount_uploader :photo, ImageUploader
end
