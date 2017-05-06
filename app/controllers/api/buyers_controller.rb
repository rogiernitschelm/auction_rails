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

    render_entity BuyerEntity, @buyer
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
