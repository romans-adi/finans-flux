require 'rails_helper'

RSpec.describe MovementsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, author: user) }

  before do
    sign_in_user(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { category_id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    let(:movement) { FactoryBot.create(:movement, category: category) }

    it 'returns a successful response' do
      get :show, params: { category_id: category.id, id: movement.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new, params: { category_id: category.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new movement' do
      movement_params = FactoryBot.attributes_for(:movement)
      expect {
        post :create, params: { category_id: category.id, movement: movement_params }
      }.to change(Movement, :count).by(1)
    end

    it 'redirects to category_movements_path after successful creation' do
      movement_params = FactoryBot.attributes_for(:movement)
      post :create, params: { category_id: category.id, movement: movement_params }
      expect(response).to redirect_to(category_movements_path(category))
    end

    it 'renders the new template with errors if creation fails' do
      movement_params = FactoryBot.attributes_for(:movement, name: nil)
      post :create, params: { category_id: category.id, movement: movement_params }
      expect(response).to render_template(:new)
      expect(response.status).to eq(422)
    end
  end
end
