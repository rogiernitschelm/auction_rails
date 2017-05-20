class SessionsController < ApplicationController
  include UserParams

  skip_authorization_check only: %i(login get_current_user)

  def login
    user = User.find_by(email: login_params[:email].to_s.downcase)

    if user && user.authenticate(login_params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id)

      render json: { auth_token: auth_token, user: show_entity(UserEntity, user), usertype: user.usertype }, status: 200
    else
      render json: { error: :invalid_username_or_password }, status: 403
    end
  end

  def get_current_user
    return render json: nil unless authorization_header?

    render json: { user: show_entity(UserEntity, current_user), usertype: current_user.usertype }
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
