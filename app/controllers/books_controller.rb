class BooksController < ApplicationController
  before_action -> { authg!('book+w') }, only: [:create, :update, :destroy]

  def index
    render json: Book.all
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    render json: Book.create(book_params)
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    render json: book
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: book
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :other)
  end
end
