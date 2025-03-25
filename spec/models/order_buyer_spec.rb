require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer)
    sleep 0.1
  end
  describe '発送情報の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_buyer.building = ''
        expect(@order_buyer).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.post_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Post code input correctly')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @order_buyer.prefecture_id = 0
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'street_addressが空だと保存できないこと' do
        @order_buyer.street_address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Street address can't be blank")
      end

      it 'telephoneが空だと保存できないこと' do
        @order_buyer.telephone = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneに数字以外が含まれていると保存できないこと' do
        @order_buyer.telephone = '090-0000-1234'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Telephone input only number')
      end
    end
  end
end