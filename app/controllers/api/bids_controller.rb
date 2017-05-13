class Api::BidsController < ApplicationController
  load_and_authorize_resource

  def create
    @bid.assign_attributes(create_params)
    AdvancedCreateAction.run(@bid)

    render_entity BidEntity, @bid
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
