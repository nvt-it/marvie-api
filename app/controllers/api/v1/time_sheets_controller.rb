class Api::V1::TimeSheetsController < ApplicationController
  before_action :load_resources

  # GET /api/v1/time_sheets
  def index
    render json: @resources
  end

  # GET /api/v1/time_sheets/1
  def show
    render json: @resource
  end

  # POST /api/v1/time_sheets
  def create
    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/time_sheets/1
  def update
    if @resource.update(time_sheet_params)
      render json: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/time_sheets/1
  def destroy
    @resource.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @resources = TimeSheet.all
      when :show, :update, :destroy
        @resource = TimeSheet.find(params[:id])
      when :create
        @resource = TimeSheet.new(time_sheet_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def time_sheet_params
      params.require(:time_sheet).permit(
        :username, :full_name, :phone, :time_in, :time_out, :working_time,
        :status, :bonus, :reason, :action, :note, :money
      )
    end
end
