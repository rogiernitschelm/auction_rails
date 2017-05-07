require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::BuyersController do
  include AuthorizationHelpers
  include ControllerHelpers

  it 'creates both a buyer and a user' do
    post :create,

      params: {
        email: 'mail@hoogle.nom',
        password: 'abcd1234',
        first_name: 'Hermien',
        last_name: 'Aap'
      }

    expect(body['user']['email']).to eq('mail@hoogle.nom')
    expect(body['user']['password']).to be(nil)
  end
end
