class Api::V1::AnnouncementsController < Api::BaseController
  before_action :load_resources

    # GET /api/v1/announcements
  def index
    announcements = @announcements.page(page).per(per_page)

    json_response({ data: announcements.map(&:json_builder), meta: meta(@announcements.size, announcements) })
  end

  # GET /api/v1/announcements/1
  def show
    json_response({ data: @announcement })
  end

  # POST /api/v1/announcements
  def create
    if @announcement.save
      json_response({ data: @announcement }, :created)

      return
    end

    json_response({ error: @announcement.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/announcements/1
  def update
    if @announcement.update(announcement_params)
      json_response({ data: @announcement })

      return
    end
    
    json_response({ error: @announcement.errors } , :unprocessable_entity)
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