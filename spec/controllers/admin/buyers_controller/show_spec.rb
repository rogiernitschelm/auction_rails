require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'shows a buyer' do
    admin = FactoryGirl.create(:user, admin: true)
    buyer = FactoryGirl.create(:buyer)

    set_authorization_header(admin.id)

    get :show, params: { id: buyer.id }

    expect(body['user']['email']).to eq(buyer.user.email)
  end
end
