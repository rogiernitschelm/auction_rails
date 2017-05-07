module ControllerHelpers
  def body
    JSON.parse(response.body)
  end

  def create_seller(with_auctions = true)
    company = FactoryGirl.create(:company, verified: true)
    @seller = FactoryGirl.create(:seller, company: company, verified: true)

    @auctions = FactoryGirl.create_list(:auction, 3, seller: @seller) if with_auctions
  end

  def create_buyer(with_auctions = true)
    company = FactoryGirl.create(:company, verified: true)
    @buyer = FactoryGirl.create(:buyer, company: company)

    @auctions = FactoryGirl.create_list(:auction, 3) if with_auctions
  end

  def create_admin(with_auctions = true)
    @admin = FactoryGirl.create(:user, admin: true)

    @auctions = FactoryGirl.create_list(:auction, 3) if with_auctions
  end
end
