include Entities

class Api::SellersController::UserEntity < BaseEntity
  class BuyerEntity < BaseEntity
    expose :id
  end

  class SellerEntity < BaseEntity
    expose :id
  end

  expose :seller, using: SellerEntity

  expose :id
  expose :email
  expose :first_name
  expose :last_name
  expose :birth_date
  expose :gender
  expose :infix
  expose :city
end
