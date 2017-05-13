class Api::ComplaintsController < ApplicationController
  load_and_authorize_resource

  def create
    @complaint = Complaint.create!(create_params)

    render json: :complaint_registered, status: 200
  end

  private

  def create_params
    params.permit(
      :title,
      :content,
      :user_id
    )
  end
end
