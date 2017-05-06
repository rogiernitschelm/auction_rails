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
    create_users(51)
  end

  it 'exposes a limited list of users' do
    get :index
    expect(parsed(response).count).to be(50)

    get :index, params: { offset: 50 }
    expect(parsed(response).count).to be(2)
  end

  it 'destroys a user' do
    delete :destroy, params: { id: User.last.id }
    expect(response.status).to be(200)
  end

  private

  def create_users(count = 3)
    count.times do |index|
      seller = Seller.new

      user = User.new(
        email: "#{index}mail@hoogle.nom",
        password: 'abcd1234',
        first_name: "Sjaak de #{index}e ",
        last_name: 'Klaassen'
      )

      user.seller = seller
      user.save!
    end
  end
end
