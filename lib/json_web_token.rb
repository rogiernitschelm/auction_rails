require 'jwt'

class JsonWebToken
  def self.encode(payload)
    payload.reverse_merge!(meta)

    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  end

  def self.valid_payload(payload)
    if expired(payload) ||
      payload['iss'] != meta[:iss] ||
      payload['aud'] != meta[:aud]
      false
    else
      true
    end
  end

  def self.meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client'
    }
  end

  def self.expired(payload)
    Time.zone.at(payload['exp']) < Time.zone.now
  end
end
