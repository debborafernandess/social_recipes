require 'rails_helper'

feature 'User access recipes' do
  scenario 'all recipes' do
    recipes = create_list(:recipe, 2)
    visit recipes_path

    expect(page).to have_css('h1', text: 'Últimas receitas')

    within('.recipes') do
      recipes.each do |recipe|
        expect(page).to have_link(recipe.name)
        expect(page).to have_content(recipe.preference.description)
        expect(page).to have_content(recipe.dish.description)
        expect(page).to have_content(recipe.cuisine.description)
        expect(page).to have_content(recipe.level)
      end
    end
  end

  scenario 'view details' do
    user = create(:user)
    recipe = create(:recipe, user: user)
    visit recipe_path(recipe)

    within('.recipe') do
      expect(page).to have_css('h1', text: recipe.name.capitalize)
      expect(page).to have_css('td', text: recipe.preference.description)
      expect(page).to have_css('td', text: recipe.cuisine.description)
      expect(page).to have_css('td', text: "#{recipe.serves} pessoas")
      expect(page).to have_css('td', text: recipe.cook_time)
      expect(page).to have_css('td', text: recipe.level)
      expect(page).to have_css('p',  text: recipe.ingredients)
      expect(page).to have_css('p',  text: recipe.directions)
    end

    expect(page).to have_link('Editar')
    expect(page).to have_link 'Voltar'
  end
end
