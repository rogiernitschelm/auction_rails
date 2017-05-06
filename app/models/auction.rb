class Auction < ApplicationRecord
  has_many :bids
  belongs_to :seller

  validates :title, length: { minimum: 20 }, allow_blank: false
  validates :description, length: { minimum: 30 }, allow_blank: false
  validates :starting_price, numericality: { greater_than: 0 }, allow_blank: false
  validates :buyout_price, numericality: { greater_than: :starting_price }

  validate :not_in_the_past, :seller_is_verified?

  private

  def seller_is_verified?
    errors.add(:seller, 'is not verified') unless seller.verified?
  end

  def not_in_the_past
    if !expires_at || expires_at < Time.zone.now
      errors.add(:expires_at, 'cannot be in the past or empty')
    end
  end
end
