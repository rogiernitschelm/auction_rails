class Auction < ApplicationRecord
  include SearchHelper

  before_destroy :bids_present?
  before_update :assert_valid_update

  has_many :bids, dependent: :destroy
  belongs_to :seller

  validates :title, length: { minimum: 20 }, allow_blank: false
  validates :description, length: { minimum: 30 }, allow_blank: false
  validates :starting_price, numericality: { greater_than: 0 }, allow_blank: false
  validates :buyout_price, numericality: { greater_than: :starting_price }, allow_blank: true

  validate :not_in_the_past?, :seller_is_verified?

  scope :with_leading_bids, ->(buyer) {
    select('auctions.*, highest_Bids.amount AS highest_bid_amount, highest_bids.id AS highest_bid_id, highest_bids.buyer_id AS highest_bid_buyer_id')
      .joins(
        '
          LEFT JOIN (SELECT DISTINCT ON (auction_id) *
          FROM bids ORDER by auction_id, amount DESC) AS highest_bids ON highest_bids.auction_id = auctions.id

        '
      ).where('highest_bids.buyer_id = ?', buyer.id)
  }

  scope :active, -> { joins(:bids).where('bids.amount < auctions.buyout_price AND expires_at > ?', Time.zone.now) }
  scope :current_price, ->(minimum = 0, maximum = 9_999_999) {
    joins(:bids).where('bids.amount > ? AND bids.amount < ?', minimum, maximum)
  }

  def active?
    return false if finished_at

    expires_at > Time.zone.now
  end

  private

  def seller_is_verified?
    errors.add(:seller, 'is not verified') unless seller.verified
  end

  def not_in_the_past?
    if !expires_at || expires_at < Time.zone.now
      errors.add(:expires_at, 'cannot be in the past or empty')
    end
  end

  def highest_bid
    return starting_price if bids.empty?

    bids.order('amount DESC').first.amount
  end

  def bids_present?
    return true if bids.empty?

    throw :abort
  end

  def assert_valid_update
    return true if changed == ['finished_at', 'updated_at']

    bids_present?
  end
end
