class AddColumnToDishIdToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :dish, index: true, foreign_key: true
    remove_column :recipes, :food_type
  end
end
