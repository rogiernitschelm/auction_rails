class Admin::ComplaintsController < ApplicationController
  load_and_authorize_resource

  def index
    render_entity MinimalComplaintEntity, @complaints
  end

end
