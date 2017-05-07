require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'destroys a buyer and a user' do
    buyer = FactoryGirl.create(:buyer)
    set_authorization_header(buyer.user.id)

    expect do
      delete :destroy, params: { id: buyer.id }
    end.to change { User.count && Buyer.count }.by(-1)

    expect(response.status).to eq(200)
  end
end
