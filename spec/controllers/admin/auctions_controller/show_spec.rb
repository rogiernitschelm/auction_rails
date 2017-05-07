require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'GET show' do
    it 'shows an auction' do
      create_admin
      set_authorization_header(@admin.id)

      get :show, params: { id: @auctions.first.id }

      expect(body['title']).to eq(@auctions.first.title)
    end
  end
end
