require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'DELETE destroy' do
    it 'destroys an auction' do
      create_admin
      set_authorization_header(@admin.id)

      expect do
        delete :destroy, params: { id: @auctions.first.id }
      end.to change { Auction.count }.by(-1)
    end
  end
end
