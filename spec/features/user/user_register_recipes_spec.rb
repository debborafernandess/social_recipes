require 'rails_helper'

feature 'User register recipes' do
  scenario 'create successfully' do
    visit new_recipe_path

    fill_in 'recipe_name',            with: 'brigadeiro'
    fill_in 'recipe_cuisine',         with: 'Brazilian'
    fill_in 'recipe_food_type',       with: 'Candy'
    select  %w(Fácil Médio Difícil).sample
    within('#recipe_serves') do
      select (1..50).to_a.sample
    end
    fill_in 'recipe_directions',      with: 'Shake, shake, shake'
    fill_in 'recipe_food_preference', with: 'A lot'
    fill_in 'recipe_ingredients',     with: 'Chocolate, milk'

    click_on 'Criar receita'

    within('.recipe') do
      expect(page).to have_css(:h1, text: 'Brigadeiro')
    end
  end

  scenario 'create without required field' do
    visit new_recipe_path
    click_on 'Criar receita'

    within('.recipe_name') { expect(page).to have_content("can't be blank") }
    within('.recipe_cuisine') { expect(page).to have_content("can't be blank") }
    within('.recipe_directions') { expect(page).to have_content("can't be blank") }
    within('.recipe_food_preference') { expect(page).to have_content("can't be blank") }
    within('.recipe_food_type') { expect(page).to have_content("can't be blank") }
    within('.recipe_ingredients') { expect(page).to have_content("can't be blank") }
  end

  scenario 'update successfully' do
    recipe = create(:recipe)
    visit edit_recipe_path(recipe)

    fill_in 'recipe_name', with: 'My own recipe'
    click_on 'Atualizar receita'

    within('.recipe') do
      expect(page).to have_css(:h1, text: 'My own recipe')
    end
  end

  scenario 'try update without required field' do
    recipe = create(:recipe)
    visit edit_recipe_path(recipe)

    fill_in 'recipe_name', with: ''
    click_on 'Atualizar receita'

    within('.recipe_name') { expect(page).to have_content("can't be blank") }
  end
end
