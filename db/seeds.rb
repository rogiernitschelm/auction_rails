User.destroy_all
Bid.destroy_all
Auction.destroy_all

auction = FactoryGirl.create(:auction)
# amount = 1 

FactoryGirl.create_list(:bid, 30, auction: auction)
