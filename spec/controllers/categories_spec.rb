require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, author: user) }

  before do
    sign_in_user(user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new category' do
      category_params = FactoryBot.attributes_for(:category)
      expect {
        post :create, params: { category: category_params }
      }.to change(Category, :count).by(1)
    end

    it 'redirects to categories_url after successful creation' do
      category_params = FactoryBot.attributes_for(:category)
      post :create, params: { category: category_params }
      expect(response).to redirect_to(categories_url)
    end

    it 'renders the new template with errors if creation fails' do
      category_params = FactoryBot.attributes_for(:category, name: nil)
      post :create, params: { category: category_params }
      expect(response).to render_template(:new)
      expect(response.status).to eq(422)
    end
  end
end
