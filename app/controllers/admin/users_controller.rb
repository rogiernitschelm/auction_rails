class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  PAGE_SIZE = 50

  def index
    @users = @users.usertype(index_params[:usertype]) if index_params[:usertype]
    @users = @users
      .search(index_params[:search_string], index_params[:filters])
      .limit(PAGE_SIZE)
      .offset(index_params[:offset] || 0)

    render_entity MinimalUserEntity, @users
  end

  def destroy
    @user.destroy!

    render json: nil, status: 200
  end

  private

  def index_params
    params.permit(
      :usertype,
      :search_string,
      { filters: [:city] },
      :offset
    )
  end
end
