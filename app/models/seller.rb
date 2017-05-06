class Seller < ApplicationRecord
  include SearchHelper

  belongs_to :user
  belongs_to :company

  has_many :auctions, dependent: :destroy

  def verified?
    verified
  end
end
