class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :buyer

  validate :valid_bid?

  scope :leading, -> {
    joins(:auction).where('bids.amount = (SELECT MAX(bids.amount) FROM bids)')
# tp Bid.select('MAX(bids.amount) as amount, bids.auction_id').group('bids.auction_id')
  }

  scope :max, -> {
    where('')
  }

  private

  def surpasses_buyout_amount?
  end

  def valid_bid?
    return false unless auction.active?
    return true if auction.bids.empty?

    amount > auction.bids.order('amount DESC').first.amount
  end
end


Bid.joins(:auction).where('bids.amount = (SELECT MAX(bids.amount) FROM bids GROUP BY bids.id)')

Client
.joins(:insurance_providers)
.where("insurance_providers.effective_on = (SELECT MAX(effective_on) FROM insurance_providers p group by client_id having p.client_id = insurance_providers.client_id)")
