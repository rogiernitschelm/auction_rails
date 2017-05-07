require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'updates a seller' do
    admin = FactoryGirl.create(:user, admin: true)
    seller = FactoryGirl.create(:seller)

    set_authorization_header(admin.id)

    put :update,

      params: {
        id: seller.id,
        email: 'fail@moogle.lom'
      }

    expect(body['user']['email']).to eq('fail@moogle.lom')
  end
end
