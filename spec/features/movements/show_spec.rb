require 'rails_helper'

RSpec.describe 'Movement Page', type: :feature do
  include LoginHelpers
  let(:user) { create(:user) }

  before do
    log_in_user(user)
    @category = create(:category)
    @movement = create(:movement, category: @category)
    visit category_movement_path(@category, @movement)
  end

  it 'displays the movement details' do
    expect(page).to have_content(@movement.name)
    expect(page).to have_content('Transaction №')
    expect(page).to have_content(number_to_currency(@movement.amount, precision: 2))
  end

  it 'navigates back to the category page' do
    find('.back').click
    expect(current_path).to eq(category_movements_path(@category))
  end
end
