class Cuisine < ActiveRecord::Base
  has_many :recipes

  validates :description, presence: true, uniqueness: true
end
