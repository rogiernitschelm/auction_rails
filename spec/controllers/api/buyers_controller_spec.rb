require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @buyer = FactoryGirl.create(:buyer)

    set_authorization_header(@buyer.user.id)
  end

  describe 'GET show' do
    it 'shows a buyer entity' do
      get :show, params: { id: @buyer.id }
      expect(body['user']['email']).to eq(@buyer.user.email)
    end
  end

  describe 'POST create' do
    it 'creates both a buyer and a user' do
      @request.headers['Authorization'] = nil

      post :create,

        params: {
          email: 'mail@hoogle.nom',
          password: 'abcd1234',
          first_name: 'Hermien',
          last_name: 'Aap'
        }

      expect(body['user']['email']).to eq('mail@hoogle.nom')
      expect(body['user']['password']).to be(nil)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a buyer and a user' do
      expect do
        delete :destroy, params: { id: @buyer.id }
      end.to change { User.count && Buyer.count }.by(-1)

      expect(response.status).to eq(200)
    end
  end

  describe 'PUT update' do
    it 'updates a buyer and a user' do
      put :update, params: { id: @buyer.id, email: 'mail@foogle.bom' }
      @buyer.reload

      expect(@buyer.user['email']).to eq('mail@foogle.bom')
      expect(@buyer.user['password']).to be(nil)
    end
  end
end
