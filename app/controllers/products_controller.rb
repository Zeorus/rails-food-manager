class ProductsController < ApplicationController

  def index
    @products = policy_scope(Product)
  end

  def show
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
  end

  private

  def product_params
    params.require(:restaurant).permit(:name, :price, :price_in_menu,
                                       :description, :category, :sub_category)
  end
end
