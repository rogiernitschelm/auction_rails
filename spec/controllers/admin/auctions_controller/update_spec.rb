require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'PUT update' do
    it 'updates an auction' do
      create_admin
      set_authorization_header(@admin.id)

      put :update, params: {
        id: @auctions.first.id,
        title: 'Een nieuwe titel voor deze veiling!'
      }

      expect(body['title']).to eq('Een nieuwe titel voor deze veiling!')
    end
  end
end
