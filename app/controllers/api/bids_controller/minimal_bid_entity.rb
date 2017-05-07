include Entities

class Api::BidsController::MinimalBidEntity < BaseEntity
  class AuctionEntity < BaseEntity
    expose :title
  end

  expose :auction, using: AuctionEntity
  expose :amount
  expose :placed_at
end
