class Admin::BidsController < ApplicationController
  load_and_authorize_resource

  def destroy
    @bid.destroy!

    render json: nil, status: 200
  end
end
