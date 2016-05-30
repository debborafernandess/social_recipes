class ChangeFoodPreferencesColumnToRecipe < ActiveRecord::Migration
  def change
    add_reference :recipes, :preference, index: true, foreign_key: true
    remove_column :recipes, :food_preference
  end
end
