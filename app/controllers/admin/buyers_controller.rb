class Admin::BuyersController < ApplicationController
  include UserParams

  load_and_authorize_resource

  def show
    render_entity BuyerEntity, @buyer
  end

  def update
    Buyer.transaction do
      @buyer.user.update_attributes!(user_params)
      @buyer.update_attributes!(buyer_params.except(:offset))
    end

    render_entity BuyerEntity, @buyer
  end

  def destroy
    @buyer.destroy!

    render json: nil, status: 200
  end

  private

  def buyer_params
    {}
  end
end
