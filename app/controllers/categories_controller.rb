class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.name} Created"
      redirect_to categories_path(@category)
    else
      flash[:alert] = "Category not created."
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Updated Successfully"
      redirect_to categories_path
    else
      flash[:notice] = "Not updated"
      render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category #{@category.name} successfully deleted."
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
