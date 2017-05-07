require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'updates a buyer' do
    admin = FactoryGirl.create(:user, admin: true)
    buyer = FactoryGirl.create(:buyer)

    set_authorization_header(admin.id)

    put :update,

      params: {
        id: buyer.id,
        email: 'fail@moogle.lom'
      }

    expect(body['user']['email']).to eq('fail@moogle.lom')
  end
end
