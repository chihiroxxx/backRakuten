require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる' do
    it 'nameとpasswordが存在すれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nameが16文字以下であれば登録できる' do
      @user.name = 'yamadataro'
      expect(@user).to be_valid
    end

    it 'passwordが8文字以上であれば登録できる' do
      @user.password = '12345678'
      expect(@user).to be_valid
    end

  end


  context '新規登録できない' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it '重複したnameは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.name = @user.name
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Name has already been taken')
    end

    it 'passwordが8文字以下では登録できない' do
      @user.password = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
    end
  end

  end
end
