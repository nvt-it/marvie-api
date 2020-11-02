class Api::V1::BudgetsController < ApplicationController
  before_action :load_resources

  # GET /api/v1/budgets
  def index
    render json: @budgets
  end

  # GET /api/v1/budgets/1
  def show
    render json: @budget
  end

  # POST /api/v1/budgets
  def create
    if @budget.save
      render json: @budget, status: :created, location: @budget
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/budgets/1
  def update
    if @budget.update(budget_params)
      render json: @budget
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/budgets/1
  def destroy
    @budget.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @budgets = Budget.all
      when :show, :update, :destroy
        @budget = Budget.find(params[:id])
      when :create
        @budget = Budget.new({ user_id: current_user.try(:id) }.merge(budget_params))
      end
    end

    # Only allow a trusted parameter "white list" through.
    def budget_params
      params.require(:budget).permit(:full_name, :username, :amount_money_jp, :latest_rate, :amount_money_vn_used)
    end
end