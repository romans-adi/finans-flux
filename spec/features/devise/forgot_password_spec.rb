require 'rails_helper'

RSpec.feature 'Forgot Password', type: :feature do
  scenario 'User can request a password reset email' do
    user = FactoryBot.create(:user)

    visit new_user_password_path

    fill_in 'Email', with: user.email
    click_button 'Send'

    expect(page).to have_content('You will receive an email with instructions')
  end

  scenario 'User cannot request a password reset email with an invalid email' do
    visit new_user_password_path

    fill_in 'Email', with: 'invalidemail'
    click_button 'Send'

    expect(page).to have_current_path(new_user_password_path)
  end
end
