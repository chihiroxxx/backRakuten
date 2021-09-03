module Api
  module V1
    class BooksController < ApplicationController
      require 'csv'
      def index
        # binding.pry
        if user = User.find(params[:user_id])
        # user_id = user.id
        books = user.books.order("created_at DESC")
        render json: {books: books, user: user} #, status: 200
        else
          render json: { message: "unauthorized" }, status: 401
        end

        # if user = User.find(id: params[:session])
        #   session[:user_id] = user.id
        #   # render json:するセッション返すのかな？
        #   # render json: { message: "sign in success" }??
        #   user_id = user.id
        #   books = user_id.books.order("created_at DESC")
        #   render json: {books: books}
        #   # render json: {user_id: user.id}
        # else
        #   render json: { message: "unauthorized" }, status: 401
        # end
      end

      def create
        # test_userid = 2

        params[:date] = Time.at(params[:date].to_i)
        book = Book.new(book_params)
        if book.valid?
          book.save
          render json: { message: "book created!" }, status: 200
        end

      end

      def update
        book = Book.find(params[:id])
        if book.update(book_params)
          render json: {book: book}
        end

      end

      def destroy
        if book = Book.find(params[:id])
          book.destroy
          render json: { message: "book destroyed!" }, status: 200
        end

      end

      def get_csv
        # books = Book.all
        if user = User.find(params[:user_id])
          # user_id = user.id
          books = user.books.order("created_at ASC")
          csv_data = CSV.generate do |csv|
            column_names = %w(id booktitle author thoughts date updated_at)
            csv << column_names
            index = 1
            books.each do |book|
              column_values = [
                index,
                book.booktitle,
                book.author,
                book.thoughts,
                book.date,
                book.updated_at,
              ]
              csv << column_values
              index += 1
            end
          end
        send_data(csv_data, filename: "bookindex.csv")
        else
          render json: { message: "unauthorized" }, status: 401
        end

      end

      private
      def book_params
        params.permit(:booktitle, :author, :bookimage, :thoughts, :date, :user_id)
      end
    end
  end
end
