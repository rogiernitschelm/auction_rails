include Entities

class Admin::AuctionsController::MinimalAuctionEntity < BaseEntity
  expose :highest_bid
  expose :title
  expose :starting_price
  expose :buyout_price
  expose :expires_at
end
