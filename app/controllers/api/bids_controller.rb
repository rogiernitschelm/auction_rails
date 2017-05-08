class Api::BidsController < ApplicationController
  load_and_authorize_resource

  def index
    @bids = @bids.leading if params[:filter] == 'leading'

    render_entity MinimalBidEntity, @bids
  end

  def create
    unless @bid.auction.active? && @bid.higher_bid?
      return render json: nil, status: 422
    end

    @bid.placed_at = Time.zone.now
    @bid.save!

    render_entity BidEntity, @bid
  end

  private

  def index_params
    params.permit(:filter)
  end
end
