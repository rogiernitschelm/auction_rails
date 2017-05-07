class Api::CompaniesController < ApplicationController
  load_and_authorize_resource

  def create
    @company = Company.create(create_params)

    render_entity CompanyEntity, @company
  end

  private

  def create_params
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
