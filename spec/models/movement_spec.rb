require 'rails_helper'

RSpec.describe Movement, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }
  let(:movement) { create(:movement, category:, user:) }

  it 'is valid with valid attributes' do
    expect(movement).to be_valid
  end

  it 'is not valid without a name' do
    movement.name = nil
    expect(movement).not_to be_valid
  end

  it 'is not valid if name is too long' do
    movement.name = 'a' * 31
    expect(movement).not_to be_valid
  end

  it 'is not valid without an amount' do
    movement.amount = nil
    expect(movement).not_to be_valid
  end

  it 'is not valid with a non-positive amount' do
    movement.amount = 0
    expect(movement).not_to be_valid

    movement.amount = -100
    expect(movement).not_to be_valid
  end

  it 'belongs to a category' do
    expect(movement.category).to eq(category)
  end

  it 'belongs to a user' do
    expect(movement.user).to eq(user)
  end
end
