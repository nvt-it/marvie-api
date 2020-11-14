class Api::V1::UsersController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/users
  def index
    resources = @resources.page(page).per(per_page)

    json_response({ data: resources.map(&:json_builder), meta: meta(@resources.size, resources) })
  end

  # GET /api/v1/users/1
  def show
    json_response({ data: @resource.try(:json_builder) })
  end

  # POST /api/v1/users
  def create
    if @resource.save
      json_response({ data: @resource.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @resource.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @resource.update(user_params)
      json_response({ data: @resource.try(:json_builder) })

      return
    end
    
    json_response({ error: @resource.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/users/1
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
         @resources = User.ransack(filter).result(distinct: true)
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
