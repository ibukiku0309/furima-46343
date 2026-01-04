require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべて入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'aaaaaあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '姓が空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it '名が空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it '姓が全角文字でない場合は登録できない' do
        @user.lastname = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname 全角文字を使用してください')
      end
      it '名が全角文字でない場合は登録できない' do
        @user.firstname = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname 全角文字を使用してください')
      end
      it '姓(カナ)が空では登録できない' do
        @user.lastnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana can't be blank")
      end
      it '名(カナ)が空では登録できない' do
        @user.firstnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana can't be blank")
      end
      it '姓(カナ)が全角カタカナでない場合は登録できない' do
        @user.lastnamekana = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastnamekana 全角カタカナで入力してください')
      end
      it '名(カナ)が全角カタカナでない場合は登録できない' do
        @user.firstnamekana = 'katakana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstnamekana 全角カタカナで入力してください')
      end
    end
  end
end
