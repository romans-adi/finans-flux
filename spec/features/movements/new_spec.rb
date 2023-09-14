require 'rails_helper'

RSpec.describe 'New Movement Page', type: :feature do
  include LoginHelpers
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:movement) { build(:movement) }

  before do
    log_in_user(user)
    visit new_category_movement_path(category)
  end

  it 'displays the form for adding a new transaction' do
    expect(page).to have_selector('h2.uppercase.text-xl', text: 'ADD TRANSACTION')
    within('form') do
      expect(page).to have_field('Transaction Name')
      expect(page).to have_field('Amount')
    end
  end

  it 'displays validation errors when submitting an empty form' do
    visit new_category_movement_path(category)
    within('form') do
      click_button 'Add Transaction'
    end
    expect(page).to have_content('prohibited this movement from being saved:')
  end

  it 'successfully submits the form with valid data' do
    within('form') do
      fill_in 'Transaction Name', with: movement.name
      fill_in 'Amount', with: movement.amount
      click_button('Add Transaction')
    end
  end
end
