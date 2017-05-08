require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::BidsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'DELETE destroy' do
    it 'destroys a bid' do
      create_admin_with_auctions
      set_authorization_header(@admin.id)

      bid = FactoryGirl.create(:bid)

      delete :destroy, params: { id: bid.id }
      expect(response.status).to be(200)
    end
  end
end
