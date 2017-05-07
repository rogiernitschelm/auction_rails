require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::SellersController do
  include AuthorizationHelper
  include ControllerHelper

  before do
    @admin = FactoryGirl.create(:user, admin: true)
    @seller = FactoryGirl.create(:seller)

    set_authorization_header(@admin.id)
  end

  it 'destroys a seller' do
    delete :destroy, params: { id: @seller.id }
    expect(Seller.count).to be(0)
  end

  it 'updates a seller' do
    put :update,

      params: {
        id: @seller.id,
        email: 'mail@noogle.gom',
        verified: true
      }

    expect(parsed(response)['user']['email']).to eq('mail@noogle.gom')
    expect(@seller.verified?).to be(true)
  end

  it 'shows a seller' do
    get :show, params: { id: @seller.id }

    expect(parsed(response)['user']['email']).to eq(@seller.user.email)
  end
end
