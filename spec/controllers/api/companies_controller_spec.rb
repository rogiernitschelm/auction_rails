require 'rails_helper'
require 'json_web_token'
require_relative '../../helpers/authorization_helper'

RSpec.describe Api::CompaniesController do
  include AuthorizationHelper

  before do |test|
    unless test.metadata[:skip_before]
      seller = Seller.new
      @user = User.new(
        email: 'mail@hoogle.nom',
        password: 'abcd1234',
        first_name: 'Hermien',
        last_name: 'Aap'
      )

      @user.seller = seller
      @user.save!

      set_authorization_header(@user.id)
    end
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
