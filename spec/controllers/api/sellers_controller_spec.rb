require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @seller = FactoryGirl.create(:seller, verified: true)
    @seller.company.update_attributes!(verified: true)

    set_authorization_header(@seller.user.id)
  end

  describe 'GET show' do
    it 'shows a seller entity' do
      get :show, params: { id: @seller.id }
      expect(body['user']['email']).to eq(@seller.user.email)
    end
  end

  describe 'POST create' do
    it 'creates both a seller and a user' do
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

  describe 'PUT update' do
    before do
      @seller = FactoryGirl.create(:seller, verified: false)

      set_authorization_header(@seller.user.id)
    end

    it 'updates a seller and a user' do
      put :update, params: { id: @seller.id, email: 'mail@foogle.bom' }

      @seller.reload

      expect(@seller.user['email']).to eq('mail@foogle.bom')
      expect(@seller.user['password']).to be(nil)
    end

    it 'does not update the seller\'s verification flag' do
      put :update, params: { id: @seller.id, verified: true }

      @seller.reload

      expect(@seller.verified).to be(false)
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a seller and a user' do
      expect do
        delete :destroy, params: { id: @seller.id }
      end.to change { User.count && Seller.count }.by(-1)

      expect(response.status).to eq(200)
    end
  end
end
