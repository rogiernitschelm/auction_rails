User.destroy_all

seller1 = Seller.new(verified: true)
user_seller = User.new(
  email: 'mail@hoogle.nom',
  password: 'abcd1234',
  first_name: 'Henk',
  last_name: 'de Vries'
)
user_seller.seller = seller1
user_seller.save!

buyer1 = Buyer.new
user_buyer1 = User.new(
  email: 'buyer1@hoogle.nom',
  password: 'abcd1234',
  first_name: 'Piet',
  infix: 'van',
  last_name: 'Oranje-Nassau'
)
user_buyer1.buyer = buyer1
user_buyer1.save!

buyer2 = Buyer.new
user_buyer2 = User.new(
  email: 'buyer2@hoogle.nom',
  password: 'abcd1234',
  first_name: 'Jacqueline',
  infix: 'van',
  last_name: 'Boer'
)
user_buyer2.buyer = buyer2
user_buyer2.save!

buyer3 = Buyer.new
user_buyer3 = User.new(
  email: 'buyer3@hoogle.nom',
  password: 'abcd1234',
  first_name: 'Aline',
  infix: 'van',
  last_name: 'Jan'
)
user_buyer3.buyer = buyer3
user_buyer3.save!

auction1 = Auction.create!(
  title: 'Schitterend billboard langs de kust',
  description: 'Op wel 10 meter afstand van het station tussen de schapen.',
  starting_price: 0.01,
  buyout_price: 100,
  expires_at: Time.zone.now + 10,
  seller: user_seller.seller
)

bid1 = Bid.create!(
  amount: 10,
  buyer: buyer1,
  auction: auction1,
  placed_at: Time.zone.now
)

bid2 = Bid.create!(
  amount: 15,
  buyer: buyer2,
  auction: auction1,
  placed_at: Time.zone.now
)

bid3 = Bid.create!(
  amount: 20,
  buyer: buyer3,
  auction: auction1,
  placed_at: Time.zone.now
)

bid4 = Bid.create!(
  amount: 100,
  buyer: buyer1,
  auction: auction1,
  placed_at: Time.zone.now
)

bid5 = Bid.create!(
  amount: 150,
  buyer: buyer2,
  auction: auction1,
  placed_at: Time.zone.now
)

bid6 = Bid.create!(
  amount: 200,
  buyer: buyer3,
  auction: auction1,
  placed_at: Time.zone.now
)
