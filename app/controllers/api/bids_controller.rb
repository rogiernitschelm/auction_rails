class Api::BidsController < ApplicationController
  load_and_authorize_resource

  def create
    @bid.placed_at = Time.zone.now
    @bid.assign_attributes(create_params)

    if @bid.save!
      render_entity BidEntity, @bid
    else
      render json: nil, status: 422
    end
  end

  private

  def create_params
    params.permit(
      :amount,
      :auction_id
    ).merge(
      buyer_id: current_user.buyer.id
    )
  end

end
