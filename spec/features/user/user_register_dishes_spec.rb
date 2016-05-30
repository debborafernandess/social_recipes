require 'rails_helper'

feature 'User register dishes' do
  scenario 'create successfully' do
    visit new_dish_path

    fill_in 'dish_description', with: 'Brazilian'

    click_on 'Criar prato'

    within('.dish') do
      expect(page).to have_css(:p, text: 'Brazilian')
    end
  end

  scenario 'create without required field' do
    visit new_dish_path
    click_on 'Criar prato'

    within('.dish_description') do
      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'update successfully' do
    dish = create(:dish)
    visit edit_dish_path(dish)

    fill_in 'dish_description', with: 'My own dish'
    click_on 'Atualizar prato'

    within('.dish') do
      expect(page).to have_css(:p, text: 'My own dish')
    end
  end

  scenario 'try update without required field' do
    dish = create(:dish)
    visit edit_dish_path(dish)

    fill_in 'dish_description', with: ''
    click_on 'Atualizar prato'

    within('.dish_description') do
      expect(page).to have_content("can't be blank")
    end
  end
end
