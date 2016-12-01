class PublishersController < ApplicationController
  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "Publisher #{@publisher.name} Created"
      redirect_to publishers_path(@publisher)
    else
      flash[:alert] = "Publisher not created."
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(publisher_params)
      flash[:notice] = "Updated"
      redirect_to publishers_path
    else
      flash[:alert] = "Error"
      render 'edit'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
    @categories = Category.all
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:notice] = "Successfully deleted..."
    redirect_to publishers_path
  end

  def index
    @publishers = Publisher.all
    @categories = Category.all
  end

  def show
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
