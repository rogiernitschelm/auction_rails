require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::ComplaintsController do
  include AuthorizationHelpers

  before do
    @seller = FactoryGirl.create(:seller)
    @user = FactoryGirl.create(:user)

    set_authorization_header(@seller.user.id)
  end

  it 'creates a complaint' do
    post :create, params: {
      title: 'hai I are une complaint',
      content: 'NONDEJU!',
      user_id: @user.id
    }

    expect(response.status).to be(200)
  end

end
