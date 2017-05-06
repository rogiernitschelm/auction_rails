class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  PAGE_SIZE = 50

  def index
    @users = @users.search(params[:search_string]) if params[:search_string]
    @users = @users
      .limit(PAGE_SIZE)
      .offset(params[:offset] || 0)

    render_entity MinimalUserEntity, @users
  end

  def destroy
    @user.destroy!

    render json: nil, status: 200
  end
end
