require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'GET show' do
    context 'when logged in as a seller' do
      before do
        create_seller

        set_authorization_header(@seller.user.id)
      end

      it 'shows an auction' do
        get :show, params: { id: @auctions.first.id }

        expect(body['title']).to eq(@auctions.first.title)
      end
    end

    context 'when logged in as a buyer' do
      before do
        create_buyer

        set_authorization_header(@buyer.user.id)
      end

      it 'shows an auction' do
        get :show, params: { id: @auctions.first.id }

        expect(body['title']).to eq(@auctions.first.title)
      end
    end
  end
end
