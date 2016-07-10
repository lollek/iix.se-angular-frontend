class BooksController < ApplicationController
  #TODO: render json returns too much data (like creation dates)
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def new
    @book = Book.new
    render json: @book
  end

  def edit
    @book = Book.find(params[:id])
    render json: @book
  end

  def create
    #@book = Book.create(book_params)
    @book = Book.new(book_params)
    @book.save
    render json: @book
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    render json: @book
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    render json: @book
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :other)
  end
end
