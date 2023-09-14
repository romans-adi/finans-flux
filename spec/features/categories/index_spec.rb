require 'rails_helper'

RSpec.feature 'Categories Index', type: :feature do
  include LoginHelpers
  let(:user) { FactoryBot.create(:user) }

  scenario 'User sees a list of categories when there are categories' do
    categories = create_list(:category, 3, icon: 'shopping', author: user)

    visit new_user_session_path
    log_in_user(user)

    visit categories_path
    categories.each do |category|
      expect(page).to have_content(category.name)
    end
  end

  scenario 'User sees a message when there are no categories' do
    visit new_user_session_path
    log_in_user(user)
    user.categories.destroy_all
    visit categories_path
    expect(page).to have_content('There are no categories created yet.')
  end
end
