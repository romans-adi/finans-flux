require 'rails_helper'

RSpec.describe Ability, type: :model do
  describe 'Abilities' do
    subject(:ability) { described_class.new(user) }

    context 'when the user is an admin' do
      let(:user) { create(:admin) }
      it { is_expected.to be_able_to(:manage, :all) }
    end

    context 'when the user is a guest (unauthenticated)' do
      let(:user) { nil }

      it { is_expected.to be_able_to(:read, :splash) }
      it { is_expected.to be_able_to(:create, User) }
      it { is_expected.to be_able_to(:read, :devise) }
      it { is_expected.not_to be_able_to(:read, Category) }
      it { is_expected.not_to be_able_to(:create, Category) }
      it { is_expected.not_to be_able_to(:update, Category) }
      it { is_expected.not_to be_able_to(:destroy, Category) }
      it { is_expected.not_to be_able_to(:create, Movement) }
      it { is_expected.not_to be_able_to(:update, Movement) }
      it { is_expected.not_to be_able_to(:destroy, Movement) }
    end

    context 'when the user is authenticated (not an admin)' do
      let(:user) { create(:user, role: nil) }

      it { is_expected.to be_able_to(:read, :splash) }
      it { is_expected.to be_able_to(:create, User) }
      it { is_expected.to be_able_to(:read, :devise) }
      it { is_expected.to be_able_to(:read, Category) }
      it { is_expected.to be_able_to(:create, Category) }
      it { is_expected.to be_able_to(:read, Movement) }
      it { is_expected.to be_able_to(:create, Movement) }

      context 'when the user is an author' do
        let(:user) { create(:user) }
        let(:author_user) { create(:user, author_id: user.id) }
        let!(:category) { create(:category, author_id: user.id) }
        let!(:movement) { create(:movement, category:) }

        it { is_expected.to be_able_to(:update, Category, id: category.id) }
        it { is_expected.to be_able_to(:destroy, Category, id: category.id) }
        it { is_expected.to be_able_to(:update, Movement, category: { author_id: user.id }) }
        it { is_expected.to be_able_to(:destroy, Movement, category: { author_id: user.id }) }
      end
    end
  end
end
