class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :destroy]

  def index
    if params[:query].present?
      @products = Product.search_name_and_category(params[:query])
      @products_all = policy_scope(Product)

      @products_all if @products.empty?
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
    @product = Product.new
    authorize @product
    if @product.save(product_params)
      render :index
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def updates
    @product = Product.new
    authorize @product
    if @product.update(product_params)
      render :index
    else
      render :show
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:restaurant).permit(:name, :price, :price_in_menu,
                                       :description)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
