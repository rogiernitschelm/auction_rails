require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns all users of a type' do
    FactoryGirl.create_list(:seller, 3)
    FactoryGirl.create_list(:buyer, 3)

    expect(User.usertype(:seller).count).to be(3)
    expect(User.usertype(:buyer).count).to be(3)
  end

  it 'creates a new user with a seller' do
    create_user

    expect(@user.seller).not_to be(nil)
  end

  it 'creates a new user with a buyer' do
    create_user('buyer')

    expect(@user.buyer).not_to be(nil)
  end

  it 'destroys both the user and the seller' do
    create_user

    expect { @user.destroy! }.to change { Seller.count }.by(-1)
  end

  private

  def create_user(usertype = 'seller')
    @user = User.new(
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Kees',
      last_name: 'de Boer'
    )

    @user.seller = Seller.new if usertype == 'seller'
    @user.buyer = Buyer.new if usertype == 'buyer'
    @user.save!
  end
end
