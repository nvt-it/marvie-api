class Api::V1::BudgetsController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/budgets
  def index
    budgets = @budgets.page(page).per(per_page)

    json_response({ data: budgets.map(&:json_builder), meta: meta(@budgets.size, budgets) })
  end

  # GET /api/v1/budgets/1
  def show
    json_response({ data: @budget.try(:json_builder) })
  end

  # POST /api/v1/budgets
  def create
    if @budget.save
      json_response({ data: @budget.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @budget.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/budgets/1
  def update
    if @budget.update(budget_params)
      json_response({ data: @budget.try(:json_builder) })

      return
    end
    
    json_response({ error: @budget.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/budgets/1
  def destroy
    if @budget.destroy
      json_response({ data: @budget.try(:json_builder) })

      return
    end

    json_response({ error: @budget.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @budgets = Budget.ransack(filter).result(distinct: true)
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