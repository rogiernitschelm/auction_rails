class User < ApplicationRecord
  include SearchHelper

  has_secure_password
  before_save :downcase

  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy

  validates :first_name, length: { minimum: 2, maximum: 30 }, allow_blank: false
  validates :last_name, length: { minimum: 2, maximum: 30 }, allow_blank: false
  validates :city, length: { minumum: 2, maximum: 30 }
  validates :password, length: { minimum: 8 }, allow_blank: false, if: :password

  validates :email, uniqueness: { case_sensitive: false }, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  scope :usertype, ->(usertype) { joins(usertype) }

  def admin?
    admin
  end

  def seller?
    seller
  end

  def buyer?
    buyer
  end

  def fully_verified?
    return seller.verified? && seller.company.verified? if seller?

    buyer.company && buyer.company.verified?
  end

  private

  def downcase
    email.downcase!
  end
end
