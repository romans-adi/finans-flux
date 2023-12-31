require 'rails_helper'

RSpec.describe 'Category Page', type: :feature do
  include LoginHelpers

  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }
  let(:movement) { create(:movement) }

  before do
    log_in_user(user)
    visit category_movements_path(category)
  end

  it 'displays the category details' do
    category = create(:category)
    create_list(:movement, 5, category:)
    visit category_movements_path(category)
    expect(page).to have_content(category.name.upcase)
    expect(page).to have_content('Total Amount: $111110.0', wait: 1)
  end

  it 'displays the list of movements' do
    category = create(:category)
    movements = create_list(:movement, 5, category:)
    visit category_movements_path(category)
    movements.each do |movement|
      expect(page).to have_content(movement.name)
      expect(page).to have_content("$#{movement.amount}")
    end
  end

  it 'displays a message when there are no movements' do
    expect(page).to have_content('No movements in this category yet.')
  end

  it 'navigates to the categories page when clicking the back button' do
    find('.back').click
    expect(current_path).to eq(categories_path)
  end

  it 'navigates to the new movement page when clicking "Add Transaction"' do
    click_link('Add Transaction')
    expect(current_path).to eq(new_category_movement_path(category))
  end
end
