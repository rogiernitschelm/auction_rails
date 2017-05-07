require 'rails_helper'

RSpec.describe Auction do
  before do
    @seller_unverified = FactoryGirl.create(:seller, verified: false)
    @seller_verified = FactoryGirl.create(:seller, verified: true)
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
