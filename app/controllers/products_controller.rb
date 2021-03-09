class ProductsController < ApplicationController
before_action :find_product, only: [:show, :edit, :destroy]
  def index
    @products = policy_scope(Product)
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
                                       :description, :category, :sub_category)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
