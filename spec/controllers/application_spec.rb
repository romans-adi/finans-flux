require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  # Define a dummy Devise controller for testing purposes
  controller do
    def index
      render plain: 'Welcome to the application!'
    end
  end

  describe 'before actions' do
    context 'when a Devise controller' do
      it 'calls configure_permitted_parameters' do
        expect(controller).to receive(:configure_permitted_parameters)
        get :index
      end
    end

    context 'when not a Devise controller' do
      it 'calls authenticate_user!' do
        expect(controller).to receive(:authenticate_user!)
        get :index
      end

      it 'skips authenticate_user! for :index action in SplashController' do
        expect(controller).not_to receive(:authenticate_user!)
        get :index, params: { controller: 'splash' }
      end
    end
  end

  describe 'Devise redirections' do
    it 'redirects to categories_path after sign-in' do
      user = create(:user) # Assuming you have a User model
      sign_in user
      expect(response).to redirect_to(categories_path)
    end

    it 'redirects to splash_root_path after sign-out' do
      user = create(:user) # Assuming you have a User model
      sign_in user
      sign_out user
      expect(response).to redirect_to(splash_root_path)
    end
  end
end
