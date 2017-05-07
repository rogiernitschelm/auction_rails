require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'destroys a buyer' do
    admin = FactoryGirl.create(:user, admin: true)
    buyer = FactoryGirl.create(:buyer)

    set_authorization_header(admin.id)

    delete :destroy, params: { id: buyer.id }

    expect(Buyer.count).to be(0)
  end
end
