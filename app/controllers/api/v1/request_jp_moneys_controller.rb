class Api::V1::RequestJpMoneysController < ApplicationController
  before_action :set_request_jp_money

  # GET /api/v1/request_jp_moneys
  def index
    render json: @resources
  end

  # GET /api/v1/request_jp_moneys/1
  def show
    render json: @resource
  end

  # POST /api/v1/request_jp_moneys
  def create
    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/request_jp_moneys/1
  def update
    if @resource.update(request_jp_money_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/request_jp_moneys/1
  def destroy
    @resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @resources = RequestJpMoney.all
      when :show, :update, :destroy
        @resource = RequestJpMoney.find(params[:id])
      when :create
        @resource = RequestJpMoney.new(request_jp_money_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def request_jp_money_params
      params.require(:request_jp_money).permit(
        :requested_user_id, :confirmed_user_id, :requested_user_name, :note, 
        :confirmed_user_name, :money_jp, :rate, :money_vn, :status, :reason
      )
    end
end
