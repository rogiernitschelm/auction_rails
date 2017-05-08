require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::AuctionsController do
  include AuthorizationHelpers
  include ControllerHelpers

  describe 'GET index' do
    before do
      create_admin_with_auctions
      set_authorization_header(@admin.id)
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

    it 'paginates the auctions' do
      FactoryGirl.create_list(:auction, 48)

      get :index

      expect(body.count).to be(50)
    end
  end

  describe 'GET show' do
    it 'shows an auction' do
      create_admin_with_auctions
      set_authorization_header(@admin.id)

      get :show, params: { id: @auctions.first.id }

      expect(body['title']).to eq(@auctions.first.title)
    end
  end

  describe 'PUT update' do
    it 'updates an auction' do
      create_admin_with_auctions
      set_authorization_header(@admin.id)

      put :update, params: {
        id: @auctions.first.id,
        title: 'Een nieuwe titel voor deze veiling!'
      }

      expect(body['title']).to eq('Een nieuwe titel voor deze veiling!')
    end
  end

  describe 'DELETE destroy' do
    it 'destroys an auction' do
      create_admin_with_auctions
      set_authorization_header(@admin.id)

      expect do
        delete :destroy, params: { id: @auctions.first.id }
      end.to change { Auction.count }.by(-1)
    end
  end
end
