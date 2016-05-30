require 'rails_helper'

feature 'User register preferences' do
  scenario 'create successfully' do
    visit new_preference_path

    fill_in 'preference_description', with: 'Brazilian'

    click_on 'Criar cozinha'

    within('.preference') do
      expect(page).to have_css(:p, text: 'Brazilian')
    end
  end

  scenario 'create without required field' do
    visit new_preference_path
    click_on 'Criar cozinha'

    within('.preference_description') do
      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'update successfully' do
    preference = create(:preference)
    visit edit_preference_path(preference)

    fill_in 'preference_description', with: 'My own preference'
    click_on 'Atualizar cozinha'

    within('.preference') do
      expect(page).to have_css(:p, text: 'My own preference')
    end
  end

  scenario 'try update without required field' do
    preference = create(:preference)
    visit edit_preference_path(preference)

    fill_in 'preference_description', with: ''
    click_on 'Atualizar cozinha'

    within('.preference_description') do
      expect(page).to have_content("can't be blank")
    end
  end
end
