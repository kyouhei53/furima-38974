require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    end

    context '購入できる時' do
      context '商品を購入できるとき' do
        it '情報が正しく入力されているとき' do
          expect(@order).to be_valid
        end
        it '建物名が空でも購入できる' do
          @order.building_name = ''
          expect(@order).to be_valid
        end
      end
      end
  


    
    context '購入できない時' do
      it '郵便番号が空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁じゃなければ購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村区が空だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号は半角数値でないと購入できない' do
        @order.tel_number = '０９０１２３４１２３４'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number number is invalid. Include half-width numbers")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @order.tel_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order.tel_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number is invalid")
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      
      




    end
    
   end
  end 
