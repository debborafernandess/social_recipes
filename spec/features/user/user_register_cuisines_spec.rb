require 'rails_helper'

feature 'User register cuisines' do
  scenario 'create successfully' do
    visit new_cuisine_path

    fill_in 'cuisine_description', with: 'Brazilian'

    click_on 'Criar cozinha'

    within('.cuisine') do
      expect(page).to have_css(:p, text: 'Brazilian')
    end
  end

  scenario 'create without required field' do
    visit new_cuisine_path
    click_on 'Criar cozinha'

    within('.cuisine_description') { expect(page).to have_content("can't be blank") }
  end

  scenario 'update successfully' do
    cuisine = create(:cuisine)
    visit edit_cuisine_path(cuisine)

    fill_in 'cuisine_description', with: 'My own cuisine'
    click_on 'Atualizar cozinha'

    within('.cuisine') do
      expect(page).to have_css(:p, text: 'My own cuisine')
    end
  end

  scenario 'try update without required field' do
    cuisine = create(:cuisine)
    visit edit_cuisine_path(cuisine)

    fill_in 'cuisine_description', with: ''
    click_on 'Atualizar cozinha'

    within('.cuisine_description') { expect(page).to have_content("can't be blank") }
  end
end
