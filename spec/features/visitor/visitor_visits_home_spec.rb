feature 'Visitor visits home' do
  scenario 'and see recipes' do
    recipes = create_list(:recipe, 3)
    visit root_path

    expect(page).to have_content 'Social Recipes'
    recipes.each do | recipe |
      expect(page).to have_content recipe.name
    end
  end
end
