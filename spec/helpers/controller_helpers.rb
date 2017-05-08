module ControllerHelpers
  def body
    JSON.parse(response.body)
  end

  def create_seller_with_auctions
    company = FactoryGirl.create(:company, verified: true)
    @seller = FactoryGirl.create(:seller, company: company, verified: true)

    @auctions = FactoryGirl.create_list(:auction, 3, seller: @seller)
  end

  def create_buyer_with_auctions
    company = FactoryGirl.create(:company, verified: true)
    @buyer = FactoryGirl.create(:buyer, company: company)

    @auctions = FactoryGirl.create_list(:auction, 3)
  end

  def create_admin_with_auctions
    @admin = FactoryGirl.create(:user, admin: true)

    @auctions = FactoryGirl.create_list(:auction, 3)
  end
end
