class Admin::AuctionsController < ApplicationController
  load_and_authorize_resource

  PAGE_SIZE = 50

  def index
    @auctions = @auctions.active if index_params[:active]
    @auctions = @auctions
      .search(index_params[:search_string])
      .offset(index_params[:offset] || 0)
      .limit(PAGE_SIZE)

    render_entity MinimalAuctionEntity, @auctions
  end

  def show
    render_entity AuctionEntity, @auction
  end

  def update
    @auction.update_attributes!(update_params)

    render_entity AuctionEntity, @auction
  end

  def destroy
    @auction.destroy!

    render json: nil, status: 200
  end

  private

  def update_params
    params.permit(
      :title,
      :description,
      :buyout_price,
      :seller_id
    )
  end

  def index_params
    params.permit(
      :offset,
      :search_string,
      :active
    )
  end
end
