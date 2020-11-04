module Api
  class BaseController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :ban_validation!

    protected

    def page
      return 1 if params[:page].blank?

      params[:page]
    end

    def per_page
      return 10 if params[:per_page].blank?

      params[:per_page]
    end

    def filter
      return  {} if params[:filter].blank?

      params[:filter]
    end

    def meta(total_count, collection)
      {
        total_count: total_count,
        total_pages: collection.try(:total_pages),
        current_page: collection.try(:current_page),
        next_page: collection.try(:next_page),
        prev_page: collection.try(:prev_page)
      }
    end

    private

    attr_reader :current_user

    def authenticate_user_from_token!
      user, token = Authority::ApiRequest.new(request.headers).call.result

      raise if user.blank? || token.blank?
      
      @current_user = user
    end

    def ban_validation!
      if @current_user.try(:ban?)
        @current_user = nil

        render nothing: true, message: 'Tài khoản của bạn đã bị Ban, vui lòng liên hệ admin!', status: :unauthorized
      end
    end
  end
end