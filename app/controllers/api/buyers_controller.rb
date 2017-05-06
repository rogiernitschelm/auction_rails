class Api::BuyersController < ApplicationController
  include UserParams

  load_and_authorize_resource except: :create
  skip_authorization_check only: :create

  def create
    Buyer.transaction do
      user = User.new(user_params)

      @buyer = Buyer.new
      @buyer.user = user
      @buyer.save!
    end

    render_entity SellerEntity, @seller
  end
end
