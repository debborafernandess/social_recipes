require 'rails_helper'

feature 'User access cuisines' do
  scenario 'all cuisines' do
    cuisines = create_list(:cuisine, 2)
    visit cuisines_path

    within('.cuisines') do
      cuisines.each do |cuisine|
        expect(page).to have_link(cuisine.description)
      end
    end
  end

  scenario 'view details' do
    cuisine = create(:cuisine)
    visit cuisine_path(cuisine)

    within('.cuisine') do
      expect(page).to have_css('p', text: cuisine.description)
    end

    expect(page).to have_link('Editar')
    expect(page).to have_link 'Voltar'
  end
end
