class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save then
      redirect_to @book
    else
      render 'new'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :other)
  end
end
