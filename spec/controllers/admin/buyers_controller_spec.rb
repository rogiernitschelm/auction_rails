require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelper
  include ControllerHelper

  before do
    @admin = FactoryGirl.create(:user, admin: true)
    @buyer = FactoryGirl.create(:buyer)
    set_authorization_header(@admin.id)
  end

  it 'destroys a buyer' do
    delete :destroy, params: { id: @buyer.id }
    expect(Buyer.count).to be(0)
  end

  it 'updates a buyer' do
    put :update,

      params: {
        id: @buyer.id,
        email: 'fail@moogle.lom'
      }

    expect(parsed(response)['user']['email']).to eq('fail@moogle.lom')
  end

  it 'shows a buyer' do
    get :show, params: { id: @buyer.id }
    expect(parsed(response)['user']['email']).to eq(@buyer.user.email)
  end
end
