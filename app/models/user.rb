class User < ApplicationRecord
  include SearchHelper

  has_secure_password
  before_save :downcase

  has_many :complaints, dependent: :destroy
  has_one :buyer, dependent: :destroy
  has_one :seller, dependent: :destroy

  validates :first_name, length: { minimum: 2, maximum: 30 }, presence: true
  validates :last_name, length: { minimum: 2, maximum: 30 }, presence: true
  validates :city, length: { minumum: 2, maximum: 30 }
  validates :password, length: { minimum: 8 }, presence: true, if: :password
  validates :email, uniqueness: { case_sensitive: false }, presence: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  scope :usertype, ->(usertype) { joins(usertype) }

  def admin?
    admin
  end

  def seller?
    return true if seller

    false
  end

  def buyer?
    return true if buyer

    false
  end

  def usertype
    return 'buyer' if buyer?
    'seller' if seller?
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
