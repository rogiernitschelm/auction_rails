require 'rails_helper'
require 'json_web_token'

RSpec.describe Api::CompaniesController do
  include AuthorizationHelpers

  before do
    @seller = FactoryGirl.create(:seller, verified: false, company: nil)

    set_authorization_header(@seller.user.id)
  end

  it 'creates a company' do
    post :create, params: company_params

    expect(response.status).to eq(200)
  end

  private

  def company_params
    {
      name: 'Hoogle.nom',
      country: 'Netherlands',
      city: 'Amsterdam',
      address: 'Botenboom 22',
      telephone: '01234566789',
      email: 'mail@hoogle.nom',
      chamber_of_commerce: 'abcd12345',
      business: 'Advertising'
    }
  end
end
