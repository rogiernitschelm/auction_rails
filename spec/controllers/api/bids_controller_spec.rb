require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BidsController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @buyer = FactoryGirl.create(:buyer)
    @buyer.company.update_attributes!(verified: true)
    @auction = FactoryGirl.create(:auction)
    @lower_bid = FactoryGirl.create(:bid, auction: @auction, amount: 10)

    set_authorization_header(@buyer.user.id)
  end

  it 'creates a bid' do
    post :create, params: {
      amount: 100,
      auction_id: @auction.id
    }

    expect(response.status).to be(200)
    expect(body['placed_at']).not_to be(nil)
  end
end
