require 'rails_helper'

RSpec.describe Auction, type: :model do
  before do
    auction = FactoryGirl.create(:auction, buyout_price: 999_999)

    FactoryGirl.create(:bid, amount: 10, auction: auction)
    FactoryGirl.create(:bid, amount: 100, auction: auction)
    FactoryGirl.create(:bid, amount: 1000, auction: auction)
  end

  context 'when requesting active auctions' do
    it 'returns all active auctions' do
      expect(Auction.active.count).to be(3)
    end
  end

  context 'when requesting auctions within a range of bids' do
    it 'returns all auctions that are within the range of bids' do
      expect(Auction.current_price(1, 11).count).to be(1)
      expect(Auction.current_price(99, 101).count).to be(1)
      expect(Auction.current_price(999, 1001).count).to be(1)
      expect(Auction.current_price(9, 101).count).to be(2)
    end
  end

  context 'when providing a search string' do
    it 'returns all auctions that partially match the search string' do
      auction1 = FactoryGirl.create(:auction, description: 'Hello! Is it me you\'re looking for?')
      auction2 = FactoryGirl.create(:auction, title: 'Een twee drie ola die jee')

      expect(Auction.search('iS IT me Y').first).to eq(auction1)
      expect(Auction.search('Een twee drie').first).to eq(auction2)
    end
  end

  context 'when creating auctions' do
    before do
      @seller_unverified = FactoryGirl.create(:seller, verified: false)
      @seller_verified = FactoryGirl.create(:seller, verified: true)
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
          seller: @seller_verified,
          expires_at: Date.yesterday
        )
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when destroying auctions' do
    it 'does not destroy an auction when there are bids present' do
      auction = FactoryGirl.create(:bid).auction

      expect { auction.destroy! }.to raise_error(ActiveRecord::RecordNotDestroyed)
    end

    it 'destroys an auction when there are no bids present' do
      auction = FactoryGirl.create(:auction)

      expect { auction.destroy! }.to change { Auction.count }.by(-1)
    end
  end

  context 'when updating auctions' do
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
end
