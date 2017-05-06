class Seller < ApplicationRecord
  include SearchHelper

  belongs_to :user
  belongs_to :company

  def verified?
    verified
  end
end
