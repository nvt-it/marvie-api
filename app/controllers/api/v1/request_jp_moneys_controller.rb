class Api::V1::RequestJpMoneysController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/request_jp_moneys
  def index
    resources = @resources.page(page).per(per_page)

    json_response({ data: resources.map(&:json_builder), meta: meta(@resources.size, resources) })
  end

  # GET /api/v1/request_jp_moneys/1
  def show
    json_response({ data: @resource.try(:json_builder) })
  end

  # POST /api/v1/request_jp_moneys
  def create
    if @resource.save
      json_response({ data: @resource.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @resource.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/request_jp_moneys/1
  def update
    if @resource.update(resource_params)
      json_response({ data: @resource.try(:json_builder) })

      return
    end
    
    json_response({ error: @resource.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/request_jp_moneys/1
  def destroy
    if @resource.destroy
      json_response({ data: @resource.try(:json_builder) })

      return
    end

    json_response({ error: @resource.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @resources = RequestJpMoney.ransack(filter).result(distinct: true)
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
