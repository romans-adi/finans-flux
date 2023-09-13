require 'rails_helper'

RSpec.feature 'Add Category', type: :feature do
  include LoginHelpers
  let(:user) { FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    log_in_user(user)
  end

  scenario 'User can add a category with valid information' do
    visit new_category_path
    category_icon = find('.icon-label', wait: 2)
    category_icon.click
    fill_in 'category_name', with: 'New Category Name'
    click_button 'Save'
    expect(page).to have_content('Category was successfully created.')
    expect(page).to have_content('New Category Name')
  end

  scenario 'User sees error messages with invalid information' do
    visit new_category_path
    click_button 'Save'
    expect(page).to have_content('2 errors prohibited this category from being saved')
    expect(page).to have_content("Name can't be blank")
  end
end
