require 'rails_helper'

feature 'User register recipes' do
  scenario 'successfully' do
    visit new_recipe_path

    fill_in 'recipe_name', with: 'brigadeiro'
    fill_in 'recipe_cuisine', with: 'Brazilian'
    fill_in 'recipe_directions', with: 'Shake, shake, shake'
    fill_in 'recipe_food_preference', with: 'A lot'
    fill_in 'recipe_food_type', with: 'Candy'
    fill_in 'recipe_ingredients', with: 'Chocolate, milk'

    click_on 'Create Recipe'

    within('.recipe') do
      expect(page).to have_css(:h1, text: 'Brigadeiro')
    end
  end

  scenario 'fail' do
    visit new_recipe_path
    click_on 'Create Recipe'

    within('.recipe_name') { expect(page).to have_content("can't be blank") }
    within('.recipe_cuisine') { expect(page).to have_content("can't be blank") }
    within('.recipe_directions') { expect(page).to have_content("can't be blank") }
    within('.recipe_food_preference') { expect(page).to have_content("can't be blank") }
    within('.recipe_food_type') { expect(page).to have_content("can't be blank") }
    within('.recipe_ingredients') { expect(page).to have_content("can't be blank") }
  end
end
