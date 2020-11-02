class Api::V1::AnnouncementsController < ApplicationController
  before_action :load_resources

  # GET /api/v1/announcements
  def index
    render json: @announcements
  end

  # GET /api/v1/announcements/1
  def show
    render json: @announcement
  end

  # POST /api/v1/announcements
  def create
    if @announcement.save
      render json: @announcement, status: :created, location: @announcement
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/announcements/1
  def update
    if @announcement.update(announcement_params)
      render json: @announcement
    else
      render json: @announcement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/announcements/1
  def destroy
    @announcement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @announcements = Announcement.all
      when :show, :update, :destroy
        @announcement = Announcement.find(params[:id])
      when :create
        @announcement = Announcement.new(announcement_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def announcement_params
      params.require(:announcement).pemit(:message, :date, :username, :role)
    end
end