class User < ApplicationRecord
  include SearchHelper

  has_secure_password
  before_save :downcase

  has_one :seller, dependent: :destroy
  has_one :buyer, dependent: :destroy

  validates_length_of :first_name, minimum: 2, maximum: 30, allow_blank: false
  validates_length_of :last_name, minimum: 2, maximum: 30, allow_blank: false
  validates_length_of :city, minumum: 2, maximum: 30
  validates_length_of :password, minimum: 8, allow_blank: false, if: :password

  validate :usertype

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  }

  validates :password, confirmation: true, if: lambda {
    new_record? || changes[:crypted_password]
  }

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

  def usertype
    raise('A usertype is required') unless seller? || buyer? || admin?
  end

  def downcase
    email.downcase!
  end
end
