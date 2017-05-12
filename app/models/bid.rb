class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :buyer

  validate :valid_bid?

  private

  def surpasses_buyout_amount?
  end

  def valid_bid?
    return false unless auction.active?
    return true if auction.bids.empty?

    amount > auction.bids.order('amount DESC').first.amount
  end
end


# Bid.joins(:auction).where('bids.amount = (SELECT MAX(bids.amount) FROM bids GROUP BY bids.id)')
