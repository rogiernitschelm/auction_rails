require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'destroys a seller and a user' do
    seller = FactoryGirl.create(:seller)
    set_authorization_header(seller.user.id)

    expect do
      delete :destroy, params: { id: seller.id }
    end.to change { User.count && Seller.count }.by(-1)

    expect(response.status).to eq(200)
  end
end
