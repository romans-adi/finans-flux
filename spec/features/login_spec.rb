require 'rails_helper'

RSpec.describe 'Login Page', type: :feature, js: true do
  before do
    visit new_user_session_path
  end

  it 'displays the login form and "Log In" button' do
    expect(page).to have_link(href: splash_root_path)
    expect(page).to have_content('Log In')
    expect(page).to have_button('Log In')

    within 'form' do
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
      expect(page).to have_link('Forgot your password?', href: new_user_password_path)
    end
  end
end
