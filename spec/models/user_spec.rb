require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when querying' do
    it 'returns all users of a type' do
      FactoryGirl.create_list(:seller, 3)
      FactoryGirl.create_list(:buyer, 3)

      expect(User.usertype(:seller).count).to be(3)
      expect(User.usertype(:buyer).count).to be(3)
    end
  end

  context 'when calling fully_verified?' do
    it 'returns true when the user is verified' do
      verified_seller = FactoryGirl.build(:seller, verified: true)
      verified_seller.company.verified = true
      verified_buyer = FactoryGirl.build(:seller)
      verified_buyer.company.verified = true

      expect(verified_seller.user.fully_verified?).to be(true)
      expect(verified_buyer.user.fully_verified?).to be(true)
    end

    it 'returns false when user is not verified' do
      unverified_seller = FactoryGirl.build(:seller, verified: false)
      unverified_buyer = FactoryGirl.build(:buyer)
      unverified_buyer.company.verified = false

      expect(unverified_seller.user.fully_verified?).to be(false)
      expect(unverified_buyer.user.fully_verified?).to be(false)
    end
  end

  context 'when creating users' do
    it 'downcases an email' do
      user = create_user(email: 'SNAIL@HOOGLE.NOM')

      expect(user.email).to eq('snail@hoogle.nom')
    end
  end

  context 'when destroying a user' do
    it 'destroys both the user and the seller' do
      create_user

      expect { @user.destroy! }.to change { Seller.count }.by(-1)
    end
  end

  private

  def create_user(usertype = 'seller', email: 'mail@hoogle.nom')
    @user = User.new(
      email: email,
      password: 'abcd1234',
      first_name: 'Kees',
      last_name: 'de Boer'
    )

    @user.seller = Seller.new if usertype == 'seller'
    @user.buyer = Buyer.new if usertype == 'buyer'
    @user.save!
    @user
  end
end
