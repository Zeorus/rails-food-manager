class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = policy_scope(Category)
  end
  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
<<<<<<< HEAD
      redirect_to products_path, notice: "category was successfully created"
    else
      render :new
=======
      redirect_to products_path, notice: "Category was successfully created"
>>>>>>> 9c48df20032ad5c5356e56ea3e881a74b0523e5d
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
<<<<<<< HEAD
      redirect_to categories_path, notice: "category was successfully updated"
=======
      redirect_to products_path, notice: "Category was successfully updated"
>>>>>>> 9c48df20032ad5c5356e56ea3e881a74b0523e5d
    else
      render :index
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_path, notice: "Category was successfully deleted"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end

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
