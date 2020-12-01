# frozen_string_literal: true

require 'firebase'

class Api::V1::AuthController < ApplicationController
  def verify
    response = Firebase.request(normalize_params[:uid])
    raise ExceptionHandler::UnauthenticatedError, response['error']['message'] unless response.code == 200

    data = response.parsed_response
    attributes = data['users'].try(:first)

    raise ExceptionHandler::VerificationError, 'Username or Password was incorrect!' if attributes.blank?

    user_id, access_token = UserService.new(attributes).verify(normalize_params)

    render json: {
      data: {
        token_type: 'Bearer',
        access_token: access_token,
        user: {
          id: user_id
        },
        message: 'Login successful'
      }
    }, status: :ok
  end

  private

  def normalize_params
    params.require(:user).permit(:uid, :language, :device_token)
  end
end