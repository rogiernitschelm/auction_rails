class Api::UsersController < ApplicationController
  include UserParams

  load_and_authorize_resource

  def update
    @user.update_attributes!(user_params)

    render_entity UserEntity, @user
  end
end
