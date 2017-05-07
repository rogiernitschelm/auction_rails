require 'json_web_token'

module AuthorizationHelpers
  def set_authorization_header(user_id)
    @request.headers['Authorization'] = JWT.encode(
      { user_id: user_id },
      Rails.application.secrets.secret_key_base
    )
  end
end
