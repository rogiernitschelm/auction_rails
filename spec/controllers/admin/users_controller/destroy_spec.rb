require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::UsersController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    admin = FactoryGirl.create(:user, admin: true)

    set_authorization_header(admin.id)
  end

  it 'destroys a user' do
    user = FactoryGirl.create(:user)

    delete :destroy, params: { id: user.id }
    expect(response.status).to be(200)
  end
end
