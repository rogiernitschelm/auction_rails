class Company < ApplicationRecord
  has_many :sellers
  has_many :buyers

  validates :name, presence: true
  validates :country, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :business, presence: true
  validates :chamber_of_commerce, presence: true

  def verified?
    verified
  end
end
