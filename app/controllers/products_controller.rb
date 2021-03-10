class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :destroy]

  def index
    if params[:query].present?
      @products = Product.search_name(params[:query])
      @products_all = policy_scope(Product)

       policy_scope(Product) if @products.empty?

    else
      @products = policy_scope(Product)
    end
  end

  def show
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    if @product.save
      render :index
    end
  end

  def edit
    authorize @product
  end

  def update
    @product = Product.new
    authorize @product
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :price_in_menu, :description)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
