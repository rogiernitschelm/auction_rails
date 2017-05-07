include Entities

class Api::AuctionsController::AuctionEntity < BaseEntity
  class BidsEntity < BaseEntity
    expose :amount
    expose :placed_at
  end

  expose :bids, using: BidsEntity
  expose :title
  expose :description
  expose :starting_price
  expose :buyout_price
  expose :expires_at
end
