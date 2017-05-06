include Entities

class Admin::SellersController::MinimalSellerEntity < BaseEntity
  class UserEntity < BaseEntity
    expose :first_name
    expose :last_name
  end

  class CompanyEntity < BaseEntity
    expose :name
  end

  expose :user, using: UserEntity
  expose :company, using: CompanyEntity
end
