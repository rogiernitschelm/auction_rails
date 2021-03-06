class Admin::CompaniesController < ApplicationController
  load_and_authorize_resource

  def update
    @company = Company.update_attributes!(update_params)

    render_entity CompanyEntity, @company
  end

  private

  def update_params
    params.permit(
      :name,
      :country,
      :telephone,
      :email,
      :city,
      :address,
      :business,
      :chamber_of_commerce,
      :verified
    )
  end
end
