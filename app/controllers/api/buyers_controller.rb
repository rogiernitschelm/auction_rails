class Api::BuyersController < ApplicationController
  include UserParams

  load_and_authorize_resource except: :create
  skip_authorization_check only: :create

  def create
    return render json: nil, status: 403 if authorization_header?

    Buyer.transaction do
      user = User.create!(user_params)

      @buyer = Buyer.new
      @buyer.user = user
      @buyer.save!
    end

    auth_token = JsonWebToken.encode(user_id: @buyer.user.id)

    render json: { auth_token: auth_token, user: @buyer.user }
  end

  def show
    render_entity BuyerEntity, @buyer
  end

  def update
    Buyer.transaction do
      @buyer.user.update_attributes!(user_params)
    end

    render_entity BuyerEntity, @buyer
  end

  def destroy
    @buyer.user.destroy!

    render json: nil, status: 200
  end
end
