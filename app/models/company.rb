class Company < ApplicationRecord
  has_many :sellers
  has_many :buyers

  def verified?
    verified
  end
end
