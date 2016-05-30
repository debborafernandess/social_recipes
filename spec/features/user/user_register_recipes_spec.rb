require 'rails_helper'

feature 'User register recipes' do
  scenario 'create successfully' do
    cuisine     = create(:cuisine)
    dish        = create(:dish)
    portion     = (1..50).to_a
    preference  = create(:preference)
    user        = create(:user)

    login(user)

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
      expect(page).to have_css(:h2, text: user.email)
    end
  end

  scenario 'create without required field' do
    user = create(:user)
    login(user)

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
    user = create(:user)
    login(user)

    recipe = create(:recipe, user: user)
    visit edit_recipe_path(recipe)

    fill_in 'recipe_name', with: 'My own recipe'
    click_on 'Atualizar receita'

    within('.recipe') do
      expect(page).to have_css(:h1, text: 'My own recipe')
    end
  end

  scenario 'try update without required field' do
    user    = create(:user)
    recipe  = create(:recipe, user: user)
    login(user)

    visit edit_recipe_path(recipe)

    fill_in 'recipe_name', with: ''
    click_on 'Atualizar receita'

    within('.recipe_name') { expect(page).to have_content("can't be blank") }
  end

  scenario 'recipe only should be updated by its owner' do
    cooker  = create(:user)
    visitor = create(:user, email: Faker::Internet.email)
    recipe  = create(:recipe, user: cooker)

    login(visitor)

    visit edit_recipe_path(recipe)

    expect(current_path).not_to eq(edit_recipe_path(recipe))
    expect(current_path).to eq(root_path)
  end
end

def login(user = nil)
  user ||= create(:user)
  visit root_path

  expect(page).not_to have_link('Nova Receita')

  click_on 'Login'

  fill_in 'user_email',    with: user.email
  fill_in 'user_password', with: user.password

  click_on 'Log in'
end
