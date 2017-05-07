Bid.destroy_all
Auction.destroy_all
User.destroy_all

auction = FactoryGirl.create(:auction)
FactoryGirl.create_list(:bid, 30, auction: auction)

puts "#{User.count} users seeded!"
puts "#{Seller.count} sellers seeded!"
puts "#{Buyer.count} buyers seeded!"
puts "#{Auction.count} auctions seeded!"
puts "#{Bid.count} bids seeded!"
