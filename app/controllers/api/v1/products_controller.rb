class Api::V1::ProductsController < Api::BaseController
  before_action :load_resources

  # GET /api/v1/products
  def index
    products = @products.page(page).per(per_page)

    json_response({ data: products.map(&:json_builder), meta: meta(@products.size, products) })
  end

  # GET /api/v1/products/1
  def show
    json_response({ data: @product.try(:json_builder) })
  end

  # POST /api/v1/products
  def create
    if @product.save
      json_response({ data: @product.try(:json_builder) }, :created)

      return
    end

    json_response({ error: @product.errors } , :unprocessable_entity)
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      json_response({ data: @product.try(:json_builder) })

      return
    end
    
    json_response({ error: @product.errors } , :unprocessable_entity)
  end

  # DELETE /api/v1/products/1
  def destroy
    if @product.destroy
      json_response({ data: @product.try(:json_builder) })

      return
    end

    json_response({ error: @product.errors } , :unprocessable_entity)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @products = Product.ransack(filter).result(distinct: true)
      when :show, :update, :destroy
        @product = Product.find(params[:id])
      when :create
        @product = Product.new(product_params)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :note, :link)
    end
end

