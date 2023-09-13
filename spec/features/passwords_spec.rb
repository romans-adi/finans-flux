require 'rails_helper'

RSpec.describe 'Password Recovery Page', type: :feature do
  it 'displays the password recovery form and "Send" button' do
    visit new_user_password_path

    expect(page).to have_link('', href: splash_root_path, class: 'back')
    expect(page).to have_content('Password Recovery')
    expect(page).to have_button('Send')

    within 'form' do
      email_field = find_field('user[email]')
      expect(email_field).to be_visible
    end
  end
end
