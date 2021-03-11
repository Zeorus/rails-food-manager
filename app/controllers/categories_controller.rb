class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = policy_scope(Category)
  end
  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to products_path, notice: "category was successfully created"
    else
      render :new
    end
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    if @category.update(category_params)
      redirect_to categories_path, notice: "category was successfully updated"
    else
      render :index
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
