require 'rails_helper'
require 'json_web_token'

RSpec.describe AuthorizationsController do
  include AuthorizationHelpers

  before do
    @buyer = FactoryGirl.create(:buyer)
  end

  it 'returns unauthorized' do
    post :login

    expect(response.status).to be(403)
  end
end
