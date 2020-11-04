# frozen_string_literal: true

require 'jwt'

class Authorization
  ALGORITHM = 'HS256'

  class << self
    def encode(payload, exp = 20.days.from_now)
      payload[:exp] = exp.to_i
      
      JWT.encode(payload, ENV['JWT_TOKEN_KEY'], ALGORITHM)
    end

    def decode(access_token)
      return if access_token.blank?

      payload = JWT.decode(access_token, ENV['JWT_TOKEN_KEY'], ALGORITHM).first
      raise ExceptionHandler::DecodeError if payload.blank?

      user = User.find_by(id: payload['id'])
      raise ExceptionHandler::DecodeError if user.blank?

      return [user, true] if payload['developer']
      raise ExceptionHandler::ExpiredSignature, 'Token was expired' if is_expired?(payload['exp'])

      [user, false]
    end

    private

    def is_expired?(exp)
      return true unless exp
      
      exp.to_s.to_i < Time.zone.now.to_i
    end
  end
end
