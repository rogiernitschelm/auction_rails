include Entities

class Api::BidsController::BidEntity < BaseEntity
  class AuctionEntity < BaseEntity
    expose :title
  end

  expose :id
  expose :auction, using: AuctionEntity
  expose :amount
  expose :placed_at
end
