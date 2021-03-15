class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def index
    # category modal
    @categories = Category.all.map do |category|
      category
    end

    # new Product / Category
    @product = Product.new
    @category = Category.new

    @category = policy_scope(Category)

    @products = policy_scope(Product)
      @productHash = {}
      @products.each do |product|
        category_name = product.category.name
        if @productHash.key?(category_name)
          @productHash["#{category_name}"].push(product)
        else
          @productHash["#{category_name}"] = [product]
        end
      end

    if params[:query].present?
      @productHash = Product.global_search(params[:query])
    else
      @productHash
    end

  end

  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params["product"]["category_id"])
    authorize @product
    if @product.save
      redirect_to products_path, notice: "Product was successfully created"
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
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
    redirect_to products_path, notice: "Product was successfully deleted"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :price_in_menu, :description, :photo, :category_id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
