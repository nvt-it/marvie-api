# app/controllers/concerns/exception_handler.rb
module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  class DecodeError < StandardError; end
  class ExpiredSignature < StandardError; end
  class UnauthenticatedError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ error: { message: e.message } }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ error: { message: e.message } }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotDestroyed do |e|
      json_response({ error: { message: e.message } }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotSaved do |e|
      json_response({ error: { message: e.message } }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotUnique do |e|
      json_response({ error: { message: e.message } }, :unprocessable_entity)
    end

    rescue_from ExceptionHandler::DecodeError do |e|
      json_response({ error: { message: e.message } }, :unauthorized)
    end

    rescue_from ExceptionHandler::ExpiredSignature do |e|
      json_response({ error: { message: e.message } }, :unauthorized)
    end

    rescue_from ExceptionHandler::UnauthenticatedError do |e|
      json_response({ error: { message: e.message } }, :unauthorized)
    end

    rescue_from StandardError do |e|
      json_response({ error: { message: e.message } }, 500)
    end
  end
end