User.destroy_all

seller = Seller.new
user = User.new(
  email: 'mail@hoogle.nom',
  password: 'abcd1234',
  first_name: 'Henk',
  last_name: 'de Vries'
)

user.seller = seller
user.save!
