require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a duplicate email' do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).not_to be_valid
  end

  it 'is not valid without a password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'has many categories' do
    user = create(:user)
    expect(user.categories.count).to eq(0)
  end

  it 'has many movements' do
    expect(user.movements.count).to eq(0)
  end

  it 'can be an admin' do
    user.role = 'admin'
    expect(user.admin?).to be true
  end

  it 'is not an admin by default' do
    expect(user.admin?).to be false
  end
end
