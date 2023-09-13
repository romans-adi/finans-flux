require 'rails_helper'

RSpec.describe 'Password Recovery Page', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  it 'displays the password recovery form and "Send" button' do
    visit new_user_password_path
    expect(page).to have_link('', href: splash_root_path, class: 'back')
    expect(page).to have_content('Password Recovery')
    expect(page).to have_button('Send')
    fill_in 'user[email]', with: user.email
    click_button 'Send'
    expect(page).to have_content('You will receive an email with instructions')
  end
end
