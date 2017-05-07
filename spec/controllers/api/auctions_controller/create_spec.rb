require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'POST create' do
    context 'when logged in as a seller' do
      before do
        create_seller

        set_authorization_header(@seller.user.id)
      end

      it 'creates an auction' do
        expect do
          post :create, params: {
            title: Faker::Lorem.sentence(5, false, 5),
            description: Faker::Lorem.paragraph,
            starting_price: 1,
            seller_id: @seller.id,
            expires_at: Faker::Date.forward(2)
          }
        end.to change { Auction.count }.by(1)
      end

      it 'does not create an auction when not verified' do
        @seller.update_attributes!(verified: false)

        expect do
          post :create, params: {
            title: Faker::Lorem.sentence(5, false, 5),
            description: Faker::Lorem.paragraph,
            starting_price: 1,
            seller_id: @seller.id,
            expires_at: Faker::Date.forward(2)
          }
        end.to raise_error(CanCan::AccessDenied)
      end
    end

    context 'when logged in as a buyer' do
      before do
        create_buyer(false)

        set_authorization_header(@buyer.user.id)
      end

      it 'does not create an auction' do
        expect do
          post :create, params: { title: 'I am an auction, hurray!' }
        end.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
