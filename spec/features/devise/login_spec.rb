require 'rails_helper'
RSpec.feature 'Login', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'User can log in with valid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_text('There are no categories created yet.')
  end

  scenario 'User cannot log in with invalid credentials' do
    visit new_user_session_path
    fill_in 'Email', with: 'invalid@example.com'
    fill_in 'Password', with: 'invalid_password'
    click_button 'Log In'

    expect(page).to have_text('Invalid Email or password', wait: 2)
  end
end
