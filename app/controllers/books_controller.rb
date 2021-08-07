class BooksController < ApplicationController
  def index
    books = Book.order("created_at DESC")
    render json: {books: books}
  end

  def create

    params[:date] = Time.at(params[:date].to_i)
    book = Book.new(book_params)
    if book.valid?
      book.save
    end

  end

  private
  def book_params
    params.permit(:booktitle, :author, :bookimage, :thoughts, :date)
  end
end
