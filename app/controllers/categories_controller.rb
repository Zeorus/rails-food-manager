class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to products_path, notice: "category was successfully created"
    end
  end

  def edit
    authorize @category
  end

  def updates
    @category = Category.new
    authorize @category
    if @category.update(category_params)
      redirect_to products_path, notice: "category was successfully updated"
    else
      render :show
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
    @category = category.find(params[:id])
  end
end
