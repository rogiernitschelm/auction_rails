require 'rails_helper'
require 'json_web_token'

require_relative '../../helpers/authorization_helper'
require_relative '../../helpers/controller_helper'

RSpec.describe Admin::UsersController do
  include AuthorizationHelper
  include ControllerHelper

  before do
    admin = User.new(
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Hermien',
      last_name: 'Aap',
      admin: true
    )

    admin.save!
    set_authorization_header(admin.id)
  end

  it 'exposes a limited list of users' do
    create_users(51)

    get :index
    expect(parsed(response).count).to be(50)

    get :index, params: { offset: 50 }
    expect(parsed(response).count).to be(2)
  end

  it 'destroys a user' do
    create_users

    delete :destroy, params: { id: User.last.id }
    expect(response.status).to be(200)
  end

  it 'finds the user when providing a search string' do
    get :index, params: { search_string: 'mail@hoogle.nom' }
    expect(parsed(response).first['first_name']).to eq('Hermien')
  end

  it 'does not find the user when providing a gibberish search string' do
    create_users

    get :index, params: { search_string: 'bla@hoogle.nom' }
    expect(parsed(response).empty?).to be(true)
  end

  it 'filters the users' do
    create_users(4)

    get :index, params: { filters: { city: 'Rotterdam' } }

    expect(parsed(response).select { |user| user['city'] == 'Amsterdam' }).to eq([])
    expect(parsed(response).select { |user| user['city'] == 'Rotterdam' }.count).to eq(2)
  end

  private

  def create_users(count = 3)
    count.times do |index|
      seller = Seller.new

      user = User.new(
        email: "#{index}test@hoogle.nom",
        password: 'abcd1234',
        first_name: "Sjaak de #{index}e ",
        last_name: 'Klaassen',
        birth_date: "#{rand(1900..2017)}-#{rand(12)}-#{rand(28)}",
        city: index.even? ? 'Amsterdam' : 'Rotterdam'
      )

      user.seller = seller
      user.save!
    end
  end
end
