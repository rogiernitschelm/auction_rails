require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    admin = FactoryGirl.create(:user, admin: true)
    @seller = FactoryGirl.create(:seller)

    set_authorization_header(admin.id)
  end

  describe 'GET show' do
    it 'shows a seller' do
      get :show, params: { id: @seller.id }

      expect(body['user']['email']).to eq(@seller.user.email)
    end
  end

  describe 'PUT update' do
    it 'updates a seller' do
      put :update,

        params: {
          id: @seller.id,
          email: 'fail@moogle.lom'
        }

      expect(body['user']['email']).to eq('fail@moogle.lom')
    end
  end

  describe 'DELETE destroy' do
    it 'destroys a seller' do
      delete :destroy, params: { id: @seller.id }

      expect(Seller.count).to be(0)
    end
  end
end
