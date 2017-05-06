class Api::BuyersController::BuyerEntity < Grape::Entity
  include Entities

  class UserEntity < Grape::Entity
    expose :first_name
    expose :last_name
    expose :email
    expose :city
  end

  expose :user, using: UserEntity
end
