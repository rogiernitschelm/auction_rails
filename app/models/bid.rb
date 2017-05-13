class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :buyer

  validates :amount, presence: true
  validates :auction, presence: true
  validates :placed_at, presence: true
  
  validate :valid_bid?

  def surpasses_buyout_amount?
    amount > auction.buyout_price
  end

  private

  def valid_bid?
    return false unless auction.active?
    return true if auction.bids.empty?

    amount > auction.bids.order('amount DESC').first.amount
  end
end
