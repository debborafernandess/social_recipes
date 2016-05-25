feature 'Visitor visits home' do
  scenario 'and see recipes' do
    recipes = create_list(:recipe, 3)
    visit root_path

    expect(page).to have_css('a.navbar-brand', text: 'Receitas')
    expect(page).to have_link 'Nova Receita'

    recipes.each do |recipe|
      expect(page).to have_content recipe.name
    end
  end
end
