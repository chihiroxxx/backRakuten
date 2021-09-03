require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe 'BOOKの感想の保存' do
    context '感想が投稿できる場合' do
      it '感想を投稿できる' do
        expect(@book).to be_valid
      end
    end
    context '感想が投稿できない場合' do
      it 'thoughtsが空では投稿できない' do
        @book.thoughts = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Thoughts can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('User must exist')
      end
    end
  end
end
