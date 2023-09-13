require 'rails_helper'

RSpec.describe 'Splash Page', type: :feature do
  it 'displays the "Finans Flux" title and links to Log In and Sign Up' do
    visit root_path
    expect(page).to have_css('h1', text: 'Finans Flux')
    expect(page).to have_link('Log In', href: new_user_session_path)
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
  end
end
