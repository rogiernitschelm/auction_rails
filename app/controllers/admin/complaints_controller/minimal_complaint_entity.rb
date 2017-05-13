include Entities

class Admin::ComplaintsController::MinimalComplaintEntity < BaseEntity
  class MinimalUserEntity < BaseEntity
    expose :id
    expose :first_name
    expose :last_name
  end

  expose :title
  expose :content
end
