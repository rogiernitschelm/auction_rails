require 'rails_helper'

RSpec.describe Api::BuyersController do
  it 'creates both a buyer and a user' do
    post :create,

      params: {
        email: 'mail@hoogle.nom',
        password: 'abcd1234',
        first_name: 'Hermien',
        last_name: 'Aap'
      }

    user = JSON.parse(response.body)['user']

    expect(response.status).to eq(200)
    expect(user['email']).to eq('mail@hoogle.nom')
    expect(user['password']).to eq(nil)
  end
end
