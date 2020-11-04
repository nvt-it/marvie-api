module Api
  module V1
    class AuthController < ApplicationController
      def login
        user = User.find_by(username: params[:username])
        
        if user.try(:authenticate, params[:password])
          json_response({
              access_token: user.try(:token),
              user: user.try(:json_builder)
            },
            'Đăng nhập thành công!',
            :ok
          )

          return
        end

        json_response({}, 'Sai tài khoản hoặc mật khẩu!', 401)
      end

      def forgot_password
        
      end
    end
  end
end