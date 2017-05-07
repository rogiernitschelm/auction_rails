require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

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
