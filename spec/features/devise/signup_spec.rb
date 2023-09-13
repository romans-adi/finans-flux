require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'User can sign up with valid information' do
    visit new_user_registration_path

    fill_in 'Full Name', with: 'John Doe'
    fill_in 'Email', with: 'johndoe@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Next'

    expect(page).to have_text('There are no categories created yet.')
  end

  scenario 'User cannot sign up with invalid information' do
    visit new_user_registration_path
    fill_in 'Full Name', with: ''
    fill_in 'Email', with: 'invalidemail'
    fill_in 'Password', with: 'short'
    click_button 'Next'

    expect(page).to have_current_path(new_user_registration_path)
  end
end
