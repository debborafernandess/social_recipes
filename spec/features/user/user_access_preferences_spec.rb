require 'rails_helper'

feature 'User access preferences' do
  scenario 'all preferences' do
    preferences = create_list(:preference, 2)
    visit preferences_path

    within('.preferences') do
      preferences.each do |preference|
        expect(page).to have_link(preference.description)
      end
    end
  end

  scenario 'view details' do
    preference = create(:preference)
    visit preference_path(preference)

    within('.preference') do
      expect(page).to have_css('p', text: preference.description)
    end

    expect(page).to have_link('Editar')
    expect(page).to have_link 'Voltar'
  end
end
