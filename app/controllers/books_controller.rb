class BooksController < ApplicationController
  def new
    @page_title = 'All Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book #{@book.title} Created!"
      redirect_to root_path
    else
      flash[:alert] = "Book not created"
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book #{@book.title} Successfully updated"
      redirect_to root_path
    else
      flash[:alert] = "Sorry, #{@book.title} ot updated."
      render 'edit'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @categories = Category.all
    @authors = Author.all
    @publishers = Publisher.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book #{@book.title}, successfully deleted!"
    redirect_to root_path
  end

  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @bookname = @book.author.first_name + ' ' + @book.author.last_name
    @categories = Category.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :coverpath)
  end
end
