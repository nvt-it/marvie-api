class Api::V1::BillsController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/bills
  def index
    bills = @bills.page(page).per(per_page)

    json_response({ data: bills.map(&:json_builder), meta: meta(@bills.size, bills) })
  end

  # GET /api/v1/bills/1
  def show
    json_response({ data: @bill.try(:json_builder) })
  end

  # POST /api/v1/bills
  def create
    if @bill.save
      json_response({ data: @bill.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @bill.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/bills/1
  def update
    if @bill.update(bill_params)
      json_response({ data: @bill.try(:json_builder) })

      return
    end
    
    json_response({ error: @bill.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/bills/1
  def destroy
    if @bill.destroy
      json_response({ data: @bill.try(:json_builder) })

      return
    end

    json_response({ error: @bill.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
        @bills = Bill.ransack(filter).result(distinct: true)
      when :show, :update, :destroy
        @bill = Bill.find(params[:id])
      when :create
        @bill = Bill.new(bill_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def bill_params
      params.require(:bill).permit(
        :customer_id, :product_id, :product_name, :link, :phone,
        :account_ya, :date_order, :username, :full_name, :amount,
        :price, :price_transport_jp, :tax_jp, :rate, :price_buy,
        :weight, :price_transport_vn, :status, :sub_fee, :number_tracking,
        :term, :delivery_time, :paid_money, :type_paid
      )
    end
end