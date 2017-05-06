class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :buyer

  validate :higher_bid?
  validate :has_active_state

  private

  def surpasses_buyout_amount?
  end

  def highest_bid
    return if auction.bids.empty?
  end

  def higher_bid?
    return true if auction.bids.empty?

    amount > auction.bids.order('amount DESC').first.amount 
  end

  def has_active_state
  end
end
