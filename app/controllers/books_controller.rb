class BooksController < ApplicationController
  require 'csv'
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

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      render json: {book: book}
    end

  end

  def get_csv
    books = Book.all
      csv_data = CSV.generate do |csv|
        column_names = %w(id booktitle author thoughts date updated_at)
        csv << column_names
        books.each do |book|
          column_values = [
            book.id,
            book.booktitle,
            book.author,
            book.thoughts,
            book.date,
            book.updated_at,
          ]
          csv << column_values
        end
      end
    send_data(csv_data, filename: "bookindex.csv")

  end

  private
  def book_params
    params.permit(:booktitle, :author, :bookimage, :thoughts, :date)
  end
end
