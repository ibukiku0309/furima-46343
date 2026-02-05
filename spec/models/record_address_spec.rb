require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(
      :record_address,
      user_id: user.id,
      item_id: item.id
    )
  end
  describe '購入情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@record_address).to be_valid
      end

      it 'buildingが空でも保存できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postcodeが空だと保存できない' do
        @record_address.postcode = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeにハイフンがないと保存できない' do
        @record_address.postcode = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postcode は3桁-4桁の形式で入力してください')
      end

      it 'prefecture_idが1だと保存できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと保存できない' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'streetaddressが空だと保存できない' do
        @record_address.streetaddress = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Streetaddress can't be blank")
      end

      it 'phonenumberが空だと保存できない' do
        @record_address.phonenumber = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it 'phonenumberにハイフンがあると保存できない' do
        @record_address.phonenumber = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phonenumber は10〜11桁の半角数字で入力してください')
      end

      it 'phonenumberが9桁以下だと保存できない' do
        @record_address.phonenumber = '090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phonenumber は10〜11桁の半角数字で入力してください')
      end

      it 'user_idが空だと保存できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
