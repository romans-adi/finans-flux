require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category.name = nil
    expect(category).not_to be_valid
  end

  it 'is not valid if name is too long' do
    category.name = 'a' * 31
    expect(category).not_to be_valid
  end

  it 'belongs to an author (user)' do
    expect(category.author).to eq(user)
  end

  it 'has many movements' do
    create(:movement, category:, user:, description: 'Description 1', amount: 100)
    create(:movement, category:, user:, description: 'Description 2', amount: 200)

    expect(category.movements.count).to eq(2)
  end

  it 'calculates the total amount correctly' do
    create(:movement, category:, user:, description: 'Description 1', amount: 100)
    create(:movement, category:, user:, description: 'Description 2', amount: 200)

    expect(category.total_amount(user.id)).to eq(300)
  end
end
