require 'json_web_token'

class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include Entities

  check_authorization

  protected
  #
  # def authenticate_request!
  #   if !payload || !JsonWebToken.valid_payload(payload.first)
  #     return invalid_authentication
  #   end
  #
  #   load_current_user!
  #   invalid_authentication unless current_user
  # end

  def invalid_authentication
    render json: { error: 'Invalid request' }, status: 403
  end

  private

  # Helper to see if the user is registered. This for occasions that
  # authorization headers could be present, but should not raise when they are.

  def authorization_header?
    return true if request.headers['Authorization'] && request.headers['Authorization'] != 'null'

    false
  end

  def payload
    auth_header = request.headers['Authorization']

    raise ActionController::InvalidAuthenticityToken unless auth_header

    token = auth_header.split(' ').last

    JsonWebToken.decode(token)
  end

  def current_user
    User.find_by(id: payload.first['user_id'])
  end
end
