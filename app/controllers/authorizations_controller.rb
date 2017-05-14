class AuthorizationsController < ApplicationController
  include UserParams

  skip_authorization_check only: :login

  def login
    user = User.find_by(email: login_params[:email].to_s.downcase)

    if user && user.authenticate(login_params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)

      render json: { auth_token: auth_token, usertype: user.usertype }, status: 200
    else
      render json: { error: :invalid_username_or_password }, status: 403
    end
  end

  private

  def login_params
    params.permit(
      :email,
      :password,
      authorization: %i(email password)
    )
  end
end
