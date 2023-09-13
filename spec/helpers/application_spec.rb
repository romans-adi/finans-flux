require 'rails_helper'

RSpec.feature 'Category icon helper', type: :feature do
  include LoginHelpers
  let(:user) { create(:user) }

  before do
    log_in_user(user)
  end

  scenario 'Displays the correct icon for a category with a valid icon' do
    category = create(:category, name: 'shopping', icon: 'fa-shopping-cart', author: user)
    create_list(:movement, 1, category:)
    visit categories_path
    expect(page).to have_css('i.fas.fa-shopping-cart.text-xl.bg-second.p-4.text-white.rounded-lg')
  end
end
