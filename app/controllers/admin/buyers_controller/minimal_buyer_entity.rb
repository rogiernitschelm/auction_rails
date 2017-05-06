include Entities

class Admin::BuyersController::MinimalBuyerEntity < BaseEntity
  class UserEntity < BaseEntity
    expose :first_name
    expose :last_name
  end

  class CompanyEntity < BaseEntity
    expose :name
    expose :verified
  end

  expose :user, using: UserEntity
  expose :company, using: CompanyEntity
end
