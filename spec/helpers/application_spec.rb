require 'rails_helper'

RSpec.feature 'Category icon helper', type: :feature do
  include LoginHelpers
  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }
  let(:movement) { create(:movement) }

  before do
    log_in_user(user)
    visit category_movements_path(category)
  end

  scenario 'Displays the correct icon for a category with a valid icon' do
    category = create(:category, icon: 'shopping', name: 'Sample Category 4', author: user)
    create_list(:movement, 1, category:)
    visit category_movements_path(category)
    expect(page).to have_selector('.fas.fa-shopping-cart.text-xl.bg-second.p-4.text-white.rounded-lg')
  end
end
