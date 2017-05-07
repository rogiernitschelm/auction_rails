require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::SellersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @seller = FactoryGirl.create(:seller)

    set_authorization_header(@seller.user.id)
  end

  it 'shows a seller entity' do
    get :show, params: { id: @seller.id }

    expect(body['user']['email']).to eq(@seller.user.email)
  end
end