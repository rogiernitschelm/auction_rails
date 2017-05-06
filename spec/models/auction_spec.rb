require 'rails_helper'

RSpec.describe Auction do
  before do
    seller = Seller.new
    @user = User.new(
      email: 'mail@hoogle.nom',
      password: 'abcd1234',
      first_name: 'Hermien',
      last_name: 'Aap'
    )

    @user.seller = seller
    @user.save!
  end

  it 'does not create an auction when the creator is invalid' do
    expect do
      Auction.create!(
        title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
        description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
        starting_price: 0.01,
        buyout_price: 100,
        seller: @user.seller,
        expires_at: Time.zone.now + 10
      )
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not create an auction in the past' do

  end

  it 'creates an auction when the creator is valid' do

  end

  it 'destroys an auction only when there are no bids present' do

  end

  it 'updates an auction only when there are no bids present' do

  end

end
