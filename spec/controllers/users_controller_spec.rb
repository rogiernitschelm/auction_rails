require 'rails_helper'
require 'json_web_token'
require_relative '../helpers/authorization_helper'

RSpec.describe UsersController do
  include AuthorizationHelper

  before do
    @buyer = FactoryGirl.create(:buyer)
  end

  it 'returns unauthorized' do
    expect { post :login }.to raise_error(ActionController::BadRequest)
  end
end
