module Api
  module V1
    class AuthController < ApplicationController
      def login
        user = User.find_by(username: normalize_params[:username])

        if user.try(:authenticate, normalize_params[:password])
          time_sheet = TimeSheet.where('ngay_tao >= ? and ngay_tao <= ? ', from, to).find_by(username: user.try(:username))

          if time_sheet.blank?
            TimeSheet.create!({
              username: user.try(:username),
              full_name: user.try(:full_name),
              phone: user.try(:phone),
              time_in: Time.zone.now
            })
          end

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

      def from
        Time.zone.now.beginning_of_day
      end

      def to
        Time.zone.now.end_of_day
      end
    end
  end
end