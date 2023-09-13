require 'rails_helper'

RSpec.describe 'Login Page', type: :feature do
  before do
    visit new_user_session_path
  end

  it 'displays the login form and "Log In" button' do
    expect(page).to have_link('Log In', href: splash_root_path)
    expect(page).to have_content('Log In')
    expect(page).to have_button('Log In')

    within 'form' do
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
      expect(page).to have_link('Forgot your password?', href: new_user_password_path)
    end
  end

  context 'with flash messages' do
    it 'displays notice flash message' do
      flash[:notice] = 'This is a notice message.'
      visit new_user_session_path
      expect(page).to have_selector('.flash.flash-notice', text: 'This is a notice message.')
    end

    it 'displays alert flash message' do
      flash[:alert] = 'This is an alert message.'
      visit new_user_session_path
      expect(page).to have_selector('.flash.flash-error', text: 'This is an alert message.')
    end
  end
end
