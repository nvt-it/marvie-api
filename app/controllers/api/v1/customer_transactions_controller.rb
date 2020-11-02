class Api::V1::CustomerTransactionsController < ApplicationController
  before_action :set_customer_transaction, only: [:show, :update, :destroy]

  # GET /api/v1/customer_transactions
  def index
    render json: @customer_transactions
  end

  # GET /api/v1/customer_transactions/1
  def show
    render json: @customer_transaction
  end

  # POST /api/v1/customer_transactions
  def create
    if @customer_transaction.save
      render json: @customer_transaction, status: :created, location: @customer_transaction
    else
      render json: @customer_transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/customer_transactions/1
  def update
    if @customer_transaction.update(customer_transaction_params)
      render json: @customer_transaction
    else
      render json: @customer_transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/customer_transactions/1
  def destroy
    @customer_transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @customer_transactions = CustomerTransaction.all
      when :show, :update, :destroy
        @customer_transaction = CustomerTransaction.find(params[:id])
      when :create
        @customer_transaction = CustomerTransaction.new(customer_transaction_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def customer_transaction_params
      params.require(:customer_transaction).permit(
        :full_name, :phone, :account_ya, :money,
        :customer_id, :username, :note, :date
      )
    end
end

