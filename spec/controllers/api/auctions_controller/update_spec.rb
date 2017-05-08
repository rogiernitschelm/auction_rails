require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'PUT update' do
    context 'when logged in as a seller' do
      before do
        create_seller_with_auctions

        set_authorization_header(@seller.user.id)
      end

      it 'updates an auction' do
        expect do
          put :update, params: {
            id: @auctions.first.id,
            title: 'Schitterende krant met heel veel plek. Bla di bla.'
          }

          @auctions.first.reload
        end.to change { @auctions.first.title }
      end
    end

    context 'when logged in as a buyer' do
      before do
        create_buyer_with_auctions

        set_authorization_header(@buyer.user.id)
      end

      it 'does not update an auction' do
        expect do
          put :update, params: { id: @auctions.first.id }
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
