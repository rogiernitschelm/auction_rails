require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::SellersController do
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

    seller = Seller.new
    user = User.new(
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Sjaak',
      last_name: 'Klaassen'
    )

    user.seller = seller
    user.save!

    set_authorization_header(admin.id)
  end

  it 'destroys a seller' do
    delete :destroy, params: { id: Seller.first.id }
    expect(Seller.count).to be(0)
  end

  it 'updates a seller' do
    put :update,

      params: {
        id: Seller.first.id,
        email: 'mail@noogle.gom',
        verified: true
      }

    expect(parsed(response)['user']['email']).to eq('mail@noogle.gom')
    expect(Seller.first.verified).to be(true)
  end

  it 'shows a seller' do
    get :show, params: { id: Seller.first.id }

    expect(parsed(response)['user']['email']).to eq('mail@hoogle.nom')
  end
end
