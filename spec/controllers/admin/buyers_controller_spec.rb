require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::BuyersController do
  include AuthorizationHelper
  include ControllerHelper

  before do
    admin = User.create!(
      email: 'admin@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Hermien',
      last_name: 'Aap',
      admin: true
    )

    buyer = Buyer.new
    user = User.new(
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Sjaak',
      last_name: 'Klaassen'
    )

    user.buyer = buyer
    user.save!

    set_authorization_header(admin.id)
  end

  it 'destroys a buyer' do
    delete :destroy, params: { id: Buyer.first.id }
    expect(Buyer.count).to be(0)
  end

  it 'updates a buyer' do
    put :update,

      params: {
        id: Buyer.first.id,
        email: 'mail@noogle.gom'
      }

    expect(parsed(response)['user']['email']).to eq('mail@noogle.gom')
  end

  it 'shows a buyer' do
    get :show, params: { id: Buyer.first.id }
    expect(parsed(response)['user']['email']).to eq('mail@hoogle.nom')
  end
end
