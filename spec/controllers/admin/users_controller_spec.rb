require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::UsersController do
  include AuthorizationHelper
  include ControllerHelper

  before do
    @admin = FactoryGirl.create(:user, admin: true)

    set_authorization_header(@admin.id)
  end

  it 'exposes a limited list of users' do
    FactoryGirl.create_list(:seller, 51)

    get :index
    expect(parsed(response).count).to be(50)

    get :index, params: { offset: 50 }
    expect(parsed(response).count).to be(2)
  end

  it 'destroys a user' do
    @user = FactoryGirl.create(:user)

    delete :destroy, params: { id: @user.id }
    expect(response.status).to be(200)
  end

  it 'finds the user when providing a search string' do
    @user = FactoryGirl.create(:user)

    get :index, params: { search_string: @user.email }
    expect(parsed(response).first['first_name']).to eq(@user.first_name)
  end

  it 'does not find the user when providing a gibberish search string' do
    FactoryGirl.create_list(:user, 3)

    get :index, params: { search_string: 'zf8q23sfl' }
    expect(parsed(response).empty?).to be(true)
  end

  it 'filters the users' do
    FactoryGirl.create(:user, city: 'Amsterdam')
    FactoryGirl.create(:user, city: 'Culemborg')

    get :index, params: { filters: { city: 'Amsterdam' } }

    expect(parsed(response).count).to eq(1)
    expect(parsed(response).select { |user| user['city'] == 'Amsterdam' }.count).to eq(1)
  end
end
