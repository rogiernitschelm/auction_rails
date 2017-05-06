include Entities

class Admin::UsersController::MinimalUserEntity < BaseEntity
  class CompanyEntity < BaseEntity
    expose :name
    expose :verified
  end

  expose :first_name
  expose :last_name
  expose :company, using: CompanyEntity, safe: true
end
