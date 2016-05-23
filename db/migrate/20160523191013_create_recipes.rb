class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine
      t.string :food_type
      t.string :food_preference
      t.integer :serves
      t.integer :cook_time
      t.string :level
      t.text :ingredients
      t.text :directions

      t.timestamps null: false
    end
  end
end
