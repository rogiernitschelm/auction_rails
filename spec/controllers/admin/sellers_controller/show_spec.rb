require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'shows a seller' do
    admin = FactoryGirl.create(:user, admin: true)
    seller = FactoryGirl.create(:seller)

    set_authorization_header(admin.id)

    get :show, params: { id: seller.id }

    expect(body['user']['email']).to eq(seller.user.email)
  end
end
