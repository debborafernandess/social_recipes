require 'rails_helper'

feature 'User register recipes' do
  scenario 'create successfully' do
    cuisine     = create(:cuisine)
    dish        = create(:dish)
    portion     = (1..50).to_a
    preference  = create(:preference)

    visit new_recipe_path

    fill_in 'recipe_name',          with: 'brigadeiro'
    within('#recipe_cuisine_id')    { select cuisine.description }
    within('#recipe_dish_id')       { select dish.description }
    within('#recipe_serves')        { select portion.sample }
    select  %w(Fácil Médio Difícil).sample
    fill_in 'recipe_directions',    with: 'Shake, shake, shake'
    within('#recipe_preference_id') { select preference.description }
    fill_in 'recipe_ingredients',   with: 'Chocolate, milk'

    click_on 'Criar receita'

    within('.recipe') do
      expect(page).to have_css(:h1, text: 'Brigadeiro')
    end
  end

  scenario 'create without required field' do
    visit new_recipe_path
    click_on 'Criar receita'

    ['.recipe_name',
     '.recipe_cuisine',
     '.recipe_dish',
     '.recipe_directions',
     '.recipe_preference',
     '.recipe_ingredients'].each do |class_name|
      within(class_name) do
        expect(page).to have_content("can't be blank")
      end
    end
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
