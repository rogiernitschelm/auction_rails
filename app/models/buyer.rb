class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :company

  has_many :bids, dependent: :destroy
end
