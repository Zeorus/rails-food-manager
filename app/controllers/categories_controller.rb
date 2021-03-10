class CategoriesController < ApplicationController
  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new
    authorize @category
    if @category.save(category_params)
      render "products_contoller/index"
    end
  end

  def edit
    authorize @category
  end

  def updates
    @category = Category.new
    authorize @category
    if @category.update(category_params)
      render :index
    else
      render :show
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categorys_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = category.find(params[:id])
  end
end
