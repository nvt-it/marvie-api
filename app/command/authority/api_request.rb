# frozen_string_literal: true

require 'authorization'

module Authority
  class ApiRequest
    prepend SimpleCommand

    def initialize(headers = {})
      @headers = headers
    end

    def call
      user_and_token
    end

    private

    attr_reader :headers, :token

    def user_and_token
      user = decoded_auth_token

      [user, token]
    end

    def decoded_auth_token
      _, @token = http_auth_header
      return [] if token.blank?

      ::Authorization.decode(token)
    end

    def http_auth_header
      author.gsub('___', ' ').split(' ') if author.present?
    end

    def author
      headers['Authorization']
    end
  end
end
