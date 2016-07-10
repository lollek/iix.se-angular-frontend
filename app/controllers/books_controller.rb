class BooksController < ApplicationController
  layout 'empty'

  def index
    @books = Book.all
    @modify = false
  end

  def rw
    @books = Book.all
    @modify = true
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save then
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :other)
  end
end
