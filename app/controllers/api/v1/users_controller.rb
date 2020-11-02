class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    @resources = User.all

    render json: @resources
  end

  # GET /api/v1/users/1
  def show
    render json: @resource
  end

  # POST /api/v1/users
  def create
    @resource = User.new(user_params)

    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @resource.update(user_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @resources = User.all
      when :show, :update, :destroy
        @resource = User.find(params[:id])
      when :create
        @resource = User.new(user_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(
        :username, :full_name, :password_digest, :phone, :email, :dob,
        :salary, :bonus, :identify, :role, :login_time, :permission, :status
      )
    end
end
