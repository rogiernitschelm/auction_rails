include Entities

class Api::CompaniesController::CompanyEntity < BaseEntity
  expose :address
  expose :business
  expose :chamber_of_commerce
  expose :city
  expose :country
  expose :email
  expose :name
  expose :telephone
end
