require 'rails_helper'
require 'json_web_token'
require_relative '../../helpers/authorization_helper'

RSpec.describe Api::BuyersController do
  include AuthorizationHelper

  before do |test|
    unless test.metadata[:skip_before]
      @buyer = FactoryGirl.create(:buyer)

      set_authorization_header(@buyer.user.id)
    end
  end

  it 'creates both a buyer and a user', skip_before: true do
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

  it 'updates a buyer and a user' do
    put :update, params: { id: @buyer.id, email: 'mail@foogle.bom' }

    @buyer.reload

    expect(@buyer.user['email']).to eq('mail@foogle.bom')
    expect(@buyer.user['password']).to be(nil)
  end

  it 'destroys a buyer and a user' do
    expect do
      delete :destroy, params: { id: @buyer.id }
    end.to change { User.count && Buyer.count }.by(-1)

    expect(response.status).to eq(200)
  end

  it 'shows a buyer entity' do
    get :show, params: { id: @buyer.id }

    user = JSON.parse(response.body)['user']

    expect(user['email']).to eq(@buyer.user.email)
  end
end
