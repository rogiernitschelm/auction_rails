class Admin::SellersController < ApplicationController
  include UserParams

  load_and_authorize_resource

  def show
    render_entity SellerEntity, @seller
  end

  def update
    Seller.transaction do
      @seller.user.update_attributes!(user_params)
      @seller.update_attributes!(seller_params)
    end

    render_entity SellerEntity, @seller
  end

  def destroy
    @seller.destroy!

    render json: nil, status: 200
  end

  private

  def seller_params
    params.permit(:verified)
  end
end
