require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @buyer = FactoryGirl.create(:buyer)

    set_authorization_header(@buyer.user.id)
  end

  it 'shows a buyer entity' do
    get :show, params: { id: @buyer.id }

    expect(body['user']['email']).to eq(@buyer.user.email)
  end
end