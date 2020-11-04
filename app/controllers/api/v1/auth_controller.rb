module Api
  module V1
    class AuthController < ApplicationController
      def login
        user = User.find_by(username: normalize_params[:username])

        if user.try(:authenticate, normalize_params[:password])
          json_response({
              access_token: user.try(:token),
              user: user.try(:json_builder),
              message: 'Đăng nhập thành công!'
            },
            :ok
          )

          return
        end

        json_response({ error: { message: 'Sai tài khoản hoặc mật khẩu!' } }, 401)
      end

      def forgot_password
        
      end

      def normalize_params
        params.require(:auth).permit(:username, :password)
      end
    end
  end
end