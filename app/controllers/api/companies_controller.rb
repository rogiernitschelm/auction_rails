class Api::CompaniesController < ApplicationController
  load_and_authorize_resource

  def create
    @company = Company.create(company_params)

    render_entity CompanyEntity, @company
  end

  private

  def company_params
    params.permit(
      :name,
      :country,
      :telephone,
      :email,
      :city,
      :address,
      :business,
      :chamber_of_commerce
    )
  end
end
