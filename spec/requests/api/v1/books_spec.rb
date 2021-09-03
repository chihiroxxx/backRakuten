require 'rails_helper'

describe "BooksAPI" do
  # before do
  #   @user = FactoryBot.create(:user)
  #   # @book = FactoryBot.create(:book)
  # end

  let(:user_params) do
    { user: {
      name: "aaiitt",
      password: "12345678"
     }
    }
  end

  # describe "GET api/v1/books#index" do
    it "ログインしてないからエラーコード401" do
      get api_v1_books_path
      # binding.pry
      # expect(response).to have_http_status(401)
      expect(response.status).to eq 401
    end

    it "ユーザー作成 200" do
      post api_v1_users_path, params: user_params
      expect(response.status).to eq 200

      # get '/api/v1/books'

    end
    it "ログインしてたら 200" do
      post api_v1_login_path, params: user_params
      binding.pry
      expect(response.status).to eq 200

      # get '/api/v1/books'

    end
  # end
end
