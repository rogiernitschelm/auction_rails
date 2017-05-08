require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BidsController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    @buyer = FactoryGirl.create(:buyer)
    @buyer.company.update_attributes!(verified: true)

    set_authorization_header(@buyer.user.id)
  end

  describe 'GET index' do
    it 'renders a list of bids' do
      FactoryGirl.create_list(:bid, 50, buyer: @buyer)

      get :index

      expect(body.count).to eq(50)
    end

    it 'renders a list of leading bids' do
      auction = FactoryGirl.create(:auction)

      FactoryGirl.create(:bid, buyer: @buyer, auction: auction, amount: 100)
      FactoryGirl.create(:bid, buyer: @buyer, auction: auction, amount: 200)
      FactoryGirl.create(:bid, buyer: @buyer, auction: auction, amount: 300)

      get :index, params: { filter: :leading }

      expect(body.count).to eq(1)
      expect(body.first['amount']).to eq('300.0')
    end
  end
end
