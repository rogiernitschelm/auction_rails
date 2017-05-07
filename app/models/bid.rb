class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :buyer

  validate :higher_bid?

  scope :leading, -> {
    joins(:auction).where('bids.amount = (SELECT MAX(bids.amount) FROM bids)')
  }

  private

  def surpasses_buyout_amount?
  end

  def higher_bid?
    return true if auction.bids.empty?

    amount > auction.bids.order('amount DESC').first.amount
  end
end
