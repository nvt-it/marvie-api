class Api::V1::CustomerTransactionsController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/customer_transactions
  def index
    customer_transactions = @customer_transactions.page(page).per(per_page)

    json_response({ data: customer_transactions.map(&:json_builder), meta: meta(@customer_transactions.size, customer_transactions) })
  end

  # GET /api/v1/customer_transactions/1
  def show
    json_response({ data: @customer_transaction.try(:json_builder) })
  end

  # POST /api/v1/customer_transactions
  def create
    if @customer_transaction.save
      json_response({ data: @customer_transaction.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @customer_transaction.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/customer_transactions/1
  def update
    if @customer_transaction.update(customer_transaction_params)
      json_response({ data: @customer_transaction.try(:json_builder) })

      return
    end
    
    json_response({ error: @customer_transaction.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/customer_transactions/1
  def destroy
    if @customer_transaction.destroy
      json_response({ data: @customer_transaction.try(:json_builder) })

      return
    end

    json_response({ error: @customer_transaction.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @customer_transactions = CustomerTransaction.ransack(filter).result(distinct: true)
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

