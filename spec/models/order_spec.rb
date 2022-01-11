require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入内容の確認' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '商品購入が成功した時' do
      it 'token、post_code、prefeuture_id、city、address、phone_numberがあれば出品できる' do
        expect(@order).to be_valid
      end
      it 'post_codeにハイフンがあれば購入できる' do
        @order.post_code = "123-4567"
        expect(@order).to be_valid
      end
      it 'prefecture_idが選択されていれば出品できる' do
        @order.prefecture_id = 2
        expect(@order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
      it 'phone_numberが数字なら購入できる' do
        @order.phone_number = "09012345678"
        expect(@order).to be_valid
      end
    end

    context '商品購入が失敗した時' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが全角数字だと購入できない' do
        @order.post_code = '１２３ー４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @order.post_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが未選択だと購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字以外だと購入できない' do
        @order.phone_number = 'aaa1111ああああ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end  
      it 'phone_numberが9桁以下だと購入できない' do
        @order.phone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていなければ出品できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end