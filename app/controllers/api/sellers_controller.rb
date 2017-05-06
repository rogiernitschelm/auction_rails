class Api::SellersController < ApplicationController
  include UserParams

  load_and_authorize_resource except: :create
  skip_authorization_check only: :create

  def create
    Seller.transaction do
      user = User.new(user_params)

      @seller = Seller.new
      @seller.user = user
      @seller.save!
    end

    render_entity SellerEntity, @seller
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
