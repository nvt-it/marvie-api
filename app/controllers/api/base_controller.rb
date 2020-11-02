module Api
  class BaseController < ApplicationController
    before_action :parse_request, :authenticate_user_from_token!
    before_action :ban_validation!

    private

    def authenticate_user_from_token!
      if !@json['api_token']
        render nothing: true, status: :unauthorized
      
        return
      end

      @user = nil
        
      User.find_each do |u|
        if Devise.secure_compare(u.api_token, @json['api_token'])
          @user = u
        end
      end
    end

    def ban_validation!
      if @user.try(:ban?)
        @user = nil

        render nothing: true, message: 'Tài khoản của bạn đã bị Ban, vui lòng liên hệ admin!', status: :unauthorized
      end
    end

    def parse_request
      @json = JSON.parse(request.body.read)
    end
  end
end