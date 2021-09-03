require 'rails_helper'

describe "BooksAPI" do
  before do
    @user = FactoryBot.create(:user)
    @book = FactoryBot.create(:book)
  end

  # let(:user_params) do
  #   { user: {
  #     name: "aaiitt",
  #     password: "12345678"
  #    }
  #   }
  # end

  # describe "GET api/v1/books#index" do
    it "ログインしてないと感想一覧取得できない 401" do
      get api_v1_books_path
      expect(response.status).to eq 401
    end

    it "ユーザー作成 200" do
      post api_v1_users_path, params:{name: @user.name, password: @user.password}
      expect(response.status).to eq 200

    end

    context 'ログインしてたら感想操作できる' do
      # it "ログインしてたら 200" do
      #   post api_v1_login_path, params:{name: @user.name, password: @user.password}
      #   expect(response.status).to eq 200

      # end

      before do
        post api_v1_login_path, params:{name: @user.name, password: @user.password}
        expect(response.status).to eq 200

      end
      it "ログインしてたら感想一覧取得できる 200" do
        get api_v1_books_path, params:{user_id: @user.id}
        expect(response.status).to eq 200

      end

      it 'ログインしてたら感想投稿できる' do
        post api_v1_books_path, params: {
          booktitle: @book.booktitle, thoughts: @book.thoughts, user_id: @user.id
        }
        expect(response.status).to eq 200
      end

      it 'ログインしてたら感想編集できる' do
        put api_v1_book_path(@book), params: {
          id: @book.id ,thoughts: @book.thoughts, user_id: @user.id
        }
        expect(response.status).to eq 200
      end

      it 'ログインしてたら感想編集できる' do
        delete api_v1_book_path(@book)
        expect(response.status).to eq 200
      end

      it 'ログインしてたらcsv出力できる' do
        get api_v1_csv_path, params:{user_id: @user.id}
        expect(response.status).to eq 200
      end
  end

  # end
end
