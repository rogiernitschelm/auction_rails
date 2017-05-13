require 'rails_helper'
require 'json_web_token'

RSpec.describe Admin::ComplaintsController do
  include AuthorizationHelpers
  include ControllerHelpers

  before do
    admin = FactoryGirl.create(:user, admin: true)
    @seller = FactoryGirl.create(:seller)
    @complaints = FactoryGirl.create_list(:complaint, 10)

    set_authorization_header(admin.id)
  end

  describe 'GET index' do
    it 'renders a list of complaints' do
      get :index

      expect(body.count).to be(10)
    end
  end
end
