require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'DELETE destroy' do
    context 'when logged in as a seller' do
      before do
        create_seller_with_auctions

        set_authorization_header(@seller.user.id)
      end

      it 'destroys an auction' do
        @auctions.first.bids.destroy_all

        expect do
          delete :destroy, params: { id: @auctions.first.id }
        end.to change { Auction.count }.by(-1)
      end
    end

    context 'when logged in as a buyer' do
      before do
        create_buyer_with_auctions

        set_authorization_header(@buyer.user.id)
      end

      it 'does not destroy an auction' do
        expect do
          post :destroy, params: { id: @auctions.first.id }
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
