class Api::V1::ProductsController < ApplicationController
  before_action :load_resources

  # GET /api/v1/products
  def index
    render json: @products
  end

  # GET /api/v1/products/1
  def show
    render json: @product
  end

  # POST /api/v1/products
  def create
    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_resources
      case params[:action].to_sym
      when :index
         @products = Product.all
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

