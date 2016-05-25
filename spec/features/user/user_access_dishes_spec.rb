require 'rails_helper'

feature 'User access dishes' do
  scenario 'all dishes' do
    dishes = create_list(:dish, 2)
    visit dishes_path

    within('.dishes') do
      dishes.each do |dish|
        expect(page).to have_css('td', text: dish.description)
      end
    end
  end

  scenario 'view details' do
    dish = create(:dish)
    visit dish_path(dish)

    within('.dish') do
      expect(page).to have_css('p', text: dish.description)
    end

    expect(page).to have_link('Editar')
    expect(page).to have_link 'Voltar'
  end
end
