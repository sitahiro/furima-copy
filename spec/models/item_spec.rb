require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報入力' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品情報入力が成功した時' do
      it 'image、items_name、explanation、price、category_id、situation_id、cost_id、prefeuture_id、days_idがあれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら出品できる' do
        @item.price = 2000
        expect(@item).to be_valid
      end
      it 'priceが300円以上なら出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9_999_999以内なら出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
      it 'category_idが選択されていれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'situation_idが選択されていれば出品できる' do
        @item.situation_id = 2
        expect(@item).to be_valid
      end
      it 'cost_idが選択されていれば出品できる' do
        @item.cost_id = 2
        expect(@item).to be_valid
      end
      it 'prefecture_idが選択されていれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'days_idが選択されていれば出品できる' do
        @item.days_id = 2
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力が失敗した時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.items_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")
      end
      it 'explanationが空だと出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half-width number')
      end
      it 'priceが300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'category_idが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'situation_idが未選択だと出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation must be other than 1')
      end
      it 'cost_idが未選択だと出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be other than 1')
      end
      it 'prefecture_idが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'days_idが未選択だと出品できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days must be other than 1')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
