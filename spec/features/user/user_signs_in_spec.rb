require 'rails_helper'

feature 'User signs in' do
  scenario 'successfully' do
    user = create(:user)
    visit root_path

    expect(page).not_to have_link('Nova Receita')

    click_on 'Login'

    fill_in 'user_email',    with: user.email
    fill_in 'user_password', with: user.password

    click_on 'Log in'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Nova Receita')
    expect(page).not_to have_link('Login')
  end
end
