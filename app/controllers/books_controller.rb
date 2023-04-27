class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:alret] = ""
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
