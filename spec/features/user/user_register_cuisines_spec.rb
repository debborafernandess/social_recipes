require 'rails_helper'

feature 'User register cuisines' do
  scenario 'successfully' do
    visit new_cuisine_path

    fill_in 'cuisine_description', with: 'Brazilian'

    click_on 'Criar cozinha'

    within('.cuisine') do
      expect(page).to have_css(:p, text: 'Brazilian')
    end
  end

  scenario 'fail' do
    visit new_cuisine_path
    click_on 'Criar cozinha'

    within('.cuisine_description') { expect(page).to have_content("can't be blank") }
  end
end
