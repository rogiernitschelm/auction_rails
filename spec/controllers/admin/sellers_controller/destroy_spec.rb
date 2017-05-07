require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'destroys a seller' do
    admin = FactoryGirl.create(:user, admin: true)
    seller = FactoryGirl.create(:seller)

    set_authorization_header(admin.id)

    delete :destroy, params: { id: seller.id }

    expect(Seller.count).to be(0)
  end
end
