require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep 0.1
  end

  describe '商品表示機能' do
    context '商品を出品できるとき' do
      it '商品情報が正しく入力されているとき' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーに「---」が選択されていると出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では出品できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '商品の状態に「---」が選択されていると出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料の負担が空では出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '配送料の負担に「---」が選択されていると出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送元の地域に「---」が選択されていると出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では出品できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '発送までの日数に「---」が選択されていると出品できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が半角数字以外だと出品できない' do
        @item.price = '111a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が¥9999999以上は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
