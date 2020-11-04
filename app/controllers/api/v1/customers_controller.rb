class Api::V1::CustomersController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/customers
  def index
    customers = @customers.page(page).per(per_page)

    json_response({ data: customers.map(&:json_builder), meta: meta(@customers.size, customers) })
  end

  # GET /api/v1/customers/1
  def show
    json_response({ data: @customer.try(:json_builder) })
  end

  # POST /api/v1/customers
  def create
    if @customer.save
      json_response({ data: @customer.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @customer.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @customer.update(customer_params)
      json_response({ data: @customer.try(:json_builder) })

      return
    end
    
    json_response({ error: @customer.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/customers/1
  def destroy
    if @customer.destroy
      json_response({ data: @customer.try(:json_builder) })

      return
    end

    json_response({ error: @customer.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @customers = Customer.ransack(filter).result(distinct: true)
      when :show, :update, :destroy
        @customer = Customer.find(params[:id])
      when :create
        @customer = Customer.new(customer_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(
        :full_name, :dob, :identify, :phone, :email, :price_buy, :price_transport_vn,
        :rate, :address, :account_ya, :password_digest, :money
      )
    end
end

