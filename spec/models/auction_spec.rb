require 'rails_helper'

RSpec.describe Auction, type: :model do
  before do
    @seller_unverified = FactoryGirl.create(:seller, verified: false)
    @seller_verified = FactoryGirl.create(:seller, verified: true)
  end

  it 'returns all active auctions' do
    auction = FactoryGirl.create(:auction, buyout_price: 999_999)

    FactoryGirl.create(:bid, amount: 10, auction: auction)
    FactoryGirl.create(:bid, amount: 100, auction: auction)
    FactoryGirl.create(:bid, amount: 1000, auction: auction)

    expect(Auction.active.count).to be(3)
    expect(Auction.current_price(1, 11).count).to be(1)
    expect(Auction.current_price(99, 101).count).to be(1)
    expect(Auction.current_price(999, 1001).count).to be(1)
    expect(Auction.current_price(9, 101).count).to be(2)
  end

  it 'does not create an auction when the creator is invalid' do
    expect do
      Auction.create!(
        title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
        description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
        starting_price: 0.01,
        buyout_price: 100,
        seller: @seller_unverified,
        expires_at: Time.zone.now + 10
      )
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not create an auction in the past' do
    expect do
      Auction.create!(
        title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
        description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
        starting_price: 0.01,
        buyout_price: 100,
        seller: @seller_unverified,
        expires_at: Date.yesterday
      )
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'does not destroy an auction when there are bids present' do
    @auction = Auction.create!(
      title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
      description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
      starting_price: 0.01,
      buyout_price: 100,
      seller: @seller_verified,
      expires_at: Time.zone.now + 10
    )

    FactoryGirl.create(:bid, auction: @auction)

    expect { @auction.destroy! }.to raise_error(ActiveRecord::RecordNotDestroyed)
  end

  it 'does not update an auction when there are bids present' do
    auction = FactoryGirl.create(:auction)
    FactoryGirl.create(:bid, auction: auction)

    expect do
      auction.update_attributes!(
        starting_price: 3,
        buyout_price: 4
      )
    end.to raise_error(ActiveRecord::RecordNotSaved)
  end

  it 'creates an auction when the creator is valid' do
    expect do
      Auction.create!(
        title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
        description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
        starting_price: 0.01,
        buyout_price: 100,
        seller: @seller_verified,
        expires_at: Time.zone.now + 10
      )
    end.to change { Auction.count }.by(1)
  end

  it 'destroys an auction when there are no bids present' do
    auction = Auction.create!(
      title: 'Geweldige krant, 4 hele centimeters ruimte voor jou',
      description: 'Het Vlaams dagblad speciaal voor de rijke Belg.',
      starting_price: 0.01,
      buyout_price: 100,
      seller: @seller_verified,
      expires_at: Time.zone.now + 10
    )
    expect { auction.destroy! }.to change { Auction.count }.by(-1)
  end

  it 'updates an auction when there are no bids present' do
    auction = FactoryGirl.create(:auction)

    expect do
      auction.update_attributes!(
        starting_price: 3,
        buyout_price: 4
      )
    end.not_to raise_error
  end
end
