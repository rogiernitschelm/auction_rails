require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    admin = FactoryGirl.create(:user, admin: true)
    @buyer = FactoryGirl.create(:buyer)

    set_authorization_header(admin.id)
  end

  describe 'GET show' do
    it 'shows a buyer' do
      get :show, params: { id: @buyer.id }

      expect(body['user']['email']).to eq(@buyer.user.email)
    end
  end

  describe 'PUT update' do
    it 'updates a buyer' do
      put :update,

        params: {
          id: @buyer.id,
          email: 'fail@moogle.lom'
        }

      expect(body['user']['email']).to eq('fail@moogle.lom')
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a buyer' do
      delete :destroy, params: { id: @buyer.id }

      expect(Buyer.count).to be(0)
    end
  end
end
