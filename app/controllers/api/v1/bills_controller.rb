class Api::V1::BillsController < ApplicationController
  before_action :load_resources

  # GET /api/v1/bills
  def index
    render json: @bills
  end

  # GET /api/v1/bills/1
  def show
    render json: @bill
  end

  # POST /api/v1/bills
  def create
    if @bill.save
      render json: @bill, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/bills/1
  def update
    if @bill.update(bill_params)
      render json: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/bills/1
  def destroy
    @bill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @bills = Bill.all
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