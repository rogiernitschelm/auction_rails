include Entities

class Admin::SellersController::SellerEntity < BaseEntity
  class UserEntity < BaseEntity
    expose :city
    expose :email
    expose :first_name
    expose :last_name
  end

  class CompanyEntity < BaseEntity
    expose :name
    expose :verified
  end

  expose :verified
  expose :user, using: UserEntity
  expose :company, using: CompanyEntity
end
