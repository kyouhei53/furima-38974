require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入機能' do

    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
      sleep 0.1
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
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が3桁ハイフン4桁じゃなければ購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '都道府県が空だと購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("地域を入力してください")
      end
      it '市町村区が空だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市町村区を入力してください")
      end
      it '番地が空だと購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空だと購入できない' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は半角数値でないと購入できない' do
        @order.tel_number = '０９０１２３４１２３４'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が9桁以下では購入できない' do
        @order.tel_number = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上では購入できない' do
        @order.tel_number = '123456789123'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("トークンを入力してください")
      end
      it 'user_idが紐づいていなければ購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが紐づいていなければ購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
      




    end
   end
  end
