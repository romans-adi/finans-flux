require 'rails_helper'

RSpec.describe SplashController, type: :controller do
  describe 'GET #index' do
    it 'renders the splash template' do
      get :index
      expect(response).to render_template('splash')
    end

    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end
end
