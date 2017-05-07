require 'rails_helper'
require 'json_web_token'
require_relative '../../helpers/authorization_helper'

RSpec.describe Api::SellersController do
  include AuthorizationHelper

  before do |test|
    unless test.metadata[:skip_before]
      @seller = FactoryGirl.create(:seller)

      set_authorization_header(@seller.user.id)
    end
  end

  it 'creates both a seller and a user', skip_before: true do
    post :create,

      params: {
        email: 'mail@hoogle.nom',
        password: 'abcd1234',
        first_name: 'Hermien',
        last_name: 'Aap'
      }

    user = JSON.parse(response.body)['user']

    expect(user['email']).to eq('mail@hoogle.nom')
    expect(user['password']).to be(nil)
  end

  it 'updates a seller and a user' do
    put :update, params: { id: @seller.id, email: 'mail@foogle.bom' }

    @seller.reload

    expect(@seller.user['email']).to eq('mail@foogle.bom')
    expect(@seller.user['password']).to be(nil)
  end

  it 'destroys a seller and a user' do
    expect do
      delete :destroy, params: { id: @seller.id }
    end.to change { User.count && Seller.count }.by(-1)

    expect(response.status).to eq(200)
  end

  it 'shows a seller entity' do
    get :show, params: { id: @seller.id }

    user = JSON.parse(response.body)['user']

    expect(user['email']).to eq(@seller.user.email)
  end
end
