class Api::BidsController::AdvancedCreateAction < AdvancedAction
  def initialize(bid)
    @bid = bid
    @bid.placed_at = Time.zone.now
  end

  def run
    return buyout if @bid.surpasses_buyout_amount?

    @bid.save!
    @bid
  end

  private

  def buyout
    Bid.transaction do
      @bid.save!
      @bid.auction.update_attributes!(finished_at: Time.zone.now)
    end

    @bid
  end
end
