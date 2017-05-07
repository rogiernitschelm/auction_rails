require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'updates a buyer and a user' do
    buyer = FactoryGirl.create(:buyer)
    set_authorization_header(buyer.user.id)

    put :update, params: { id: buyer.id, email: 'mail@foogle.bom' }
    buyer.reload

    expect(buyer.user['email']).to eq('mail@foogle.bom')
    expect(buyer.user['password']).to be(nil)
  end
end
