include Entities

class Admin::BuyersController::BuyerEntity < BaseEntity
  class UserEntity < BaseEntity
    expose :first_name
    expose :last_name
    expose :email
  end

  class CompanyEntity < BaseEntity
    expose :name
  end

  expose :user, using: UserEntity
  expose :company, using: CompanyEntity
end
