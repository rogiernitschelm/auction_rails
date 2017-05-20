include Entities

class Api::BuyersController::UserEntity < BaseEntity
  class BuyerEntity < BaseEntity
    expose :id
  end

  class SellerEntity < BaseEntity
    expose :id
  end

  expose :buyer, using: BuyerEntity

  expose :id
  expose :email
  expose :first_name
  expose :last_name
  expose :birth_date
  expose :gender
  expose :infix
  expose :city
end
