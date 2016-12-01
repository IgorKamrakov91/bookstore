class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author #{@author.first_name} Created"
      redirect_to authors_path(@author)
    else
      flash[:alert] = "Author not created."
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      flash[:notice] = "Updated"
      redirect_to authors_path
    else
      flash[:alert] = "Not updated"
      render 'edit'
    end
  end

  def edit
    @author = Author.find(params[:id])
    @categories = Category.all
  end

  def destroy
  end

  def index
    @authors = Author.all
    @categories = Category.all
  end

  def show
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
