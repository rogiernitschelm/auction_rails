class UsersController < ApplicationController
  include UserParams

  load_and_authorize_resource

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)

      render json: { auth_token: auth_token }, status: 200
    else
      render json: { error: :invalid_username_or_password }, status: 403
    end
  end

  def update
    @user.update_attributes!(user_params)
  end
end
