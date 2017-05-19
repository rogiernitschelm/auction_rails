class Api::SellersController < ApplicationController
  include UserParams

  load_and_authorize_resource except: :create
  skip_authorization_check only: :create

  def create
    return render json: nil, status: 403 if authorization_header?

    Seller.transaction do
      user = User.new(user_params)

      @seller = Seller.new
      @seller.user = user
      @seller.save!
    end

    auth_token = JsonWebToken.encode(user_id: @seller.user.id)

    render json: { auth_token: auth_token, user: @seller.user }
  end

  def show
    render_entity SellerEntity, @seller
  end

  def update
    Seller.transaction do
      @seller.user.update_attributes!(user_params)
    end

    render_entity SellerEntity, @seller
  end

  def destroy
    @seller.user.destroy!

    render json: nil, status: 200
  end
end
