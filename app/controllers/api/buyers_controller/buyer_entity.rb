include Entities

class Api::BuyersController::BuyerEntity < BaseEntity
  class UserEntity < BaseEntity
    expose :city
    expose :email
    expose :first_name
    expose :last_name
  end

  class CompanyEntity < BaseEntity
    expose :name
  end

  expose :user, using: UserEntity
  expose :company, using: CompanyEntity
end
