require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'GET index' do
    context 'when logged in as a seller' do
      before do
        create_seller_with_auctions

        set_authorization_header(@seller.user.id)
      end

      it 'shows a list of auctions' do
        get :index

        expect(body.count).to be(3)
      end

      it 'correctly offsets the list of auctions' do
        get :index, params: { offset: 1 }

        expect(body.count).to be(2)
      end

      it 'correctly searches the list of auctions' do
        @auctions.first.title = 'Ali baba en de 70 rovers'
        @auctions.first.save!

        get :index, params: { search_string: 'Ali baba en de 70 rovers' }

        expect(body.count).to be(1)
        expect(body.first['title']).to eq('Ali baba en de 70 rovers')
      end

      it 'does not show other user\'s auctions' do
        FactoryGirl.create_list(:auction, 4)

        get :index

        expect(body.count).to be(3)
      end

      it 'paginates the auctions' do
        FactoryGirl.create_list(:auction, 48, seller: @seller)

        get :index

        expect(body.count).to be(50)
      end
    end

    context 'logged in as a buyer' do
      before do
        create_buyer_with_auctions
        set_authorization_header(@buyer.user.id)
      end

      it 'shows a list of auctions' do
        get :index

        expect(body.count).to be(3)
      end

      it 'shows the auctions with the buyer\'s leading bid' do
        FactoryGirl.create(:bid, auction: Auction.first, buyer: @buyer)
        FactoryGirl.create(:bid, auction: Auction.second, buyer: @buyer)
        FactoryGirl.create(:bid, auction: Auction.third, buyer: @buyer)
        FactoryGirl.create(:bid)

        get :index, params: { with_leading_bids: true }

        expect(body.count).to be(3)
      end

      it 'does not show the auctions when the buyer has a non-leading bid' do
        auction = FactoryGirl.create(:auction)
        FactoryGirl.create(:bid, auction: auction, buyer: @buyer, amount: 10)
        FactoryGirl.create(:bid, auction: auction, amount: 20)

        get :index, params: { with_leading_bids: true }

        expect(body.count).to be(0)
      end
    end
  end
end
