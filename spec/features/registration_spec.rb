require 'rails_helper'

RSpec.describe 'Registration Page', type: :feature do
  it 'displays the registration form and "Next" button' do
    visit new_user_registration_path

    expect(page).to have_link('', href: splash_root_path, class: 'back')
    expect(page).to have_content('Register')
    expect(page).to have_button('Next')

    within 'form' do
      expect(page).to have_field('Full Name', type: 'text')
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
    end
  end
end
