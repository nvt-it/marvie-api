class Api::V1::TimeSheetsController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/time_sheets
  def index
    time_sheets = @time_sheets.page(page).per(per_page)

    json_response({ data: time_sheets.map(&:json_builder), meta: meta(@time_sheets.size, time_sheets) })
  end

  # GET /api/v1/time_sheets/1
  def show
    json_response({ data: @time_sheet.try(:json_builder) })
  end

  # POST /api/v1/time_sheets
  def create
    ts = TimeSheet.where('ngay_tao >= ? and ngay_tao <= ? ', from, to).find_by(username: current_user.try(:username))

    if ts.present?
      json_response({ error: {
        message: 'User này đã checkin, không thể checkin thêm!'
      } } , :unprocessable_entity)

      return
    end

    if @time_sheet.save
      json_response({ data: @time_sheet.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @time_sheet.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/time_sheets/1
  def update
    if @time_sheet.update(time_sheet_params)
      json_response({ data: @time_sheet.try(:json_builder) })

      return
    end
    
    json_response({ error: @time_sheet.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/time_sheets/1
  def destroy
    if @time_sheet.destroy
      json_response({ data: @time_sheet.try(:json_builder) })

      return
    end

    json_response({ error: @time_sheet.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @resources = TimeSheet.ransack(filter).result(distinct: true)
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
