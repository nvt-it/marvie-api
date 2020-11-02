class Api::V1::CustomersController < ApplicationController
  before_action :load_resources

  # GET /api/v1/customers
  def index
    render json: @customers
  end

  # GET /api/v1/customers/1
  def show
    render json: @customer
  end

  # POST /api/v1/customers
  def create
    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @customers = Customer.all
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

