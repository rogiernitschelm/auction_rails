class AuthorizationsController < ApplicationController
  include UserParams

  skip_authorization_check only: :login

  def login
    user = User.find_by(email: params[:email].to_s.downcase)

    if user && user.authenticate(params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)

      render json: { auth_token: auth_token }, status: 200
    else
      render json: { error: :invalid_username_or_password }, status: 403
    end
  end
end
