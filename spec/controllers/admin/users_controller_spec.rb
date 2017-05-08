require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::UsersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    admin = FactoryGirl.create(:user, admin: true)

    set_authorization_header(admin.id)
  end

  describe 'DELETE destroy' do
    it 'destroys a user' do
      user = FactoryGirl.create(:user)

      delete :destroy, params: { id: user.id }
      expect(response.status).to be(200)
    end
  end

  describe 'GET index' do
    it 'exposes a limited list of users' do
      FactoryGirl.create_list(:seller, 51)

      get :index
      expect(body.count).to be(50)

      get :index, params: { offset: 50 }
      expect(body.count).to be(2)
    end

    it 'finds the user when providing a search string' do
      user = FactoryGirl.create(:user)

      get :index, params: { search_string: user.email }
      expect(body.first['first_name']).to eq(user.first_name)
    end

    it 'does not find the user when providing a gibberish search string' do
      FactoryGirl.create_list(:user, 3)

      get :index, params: { search_string: 'zf8q23sfl' }
      expect(body.empty?).to be(true)
    end
  end
end
