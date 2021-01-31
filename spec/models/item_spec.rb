require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる場合' do
      it '画像、商品名、説明文、カテゴリー、状態、配送料負担、発送元、発送までの日数、販売金額が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない'do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'コンディションが未選択だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it '配送料負担が未選択だと出品できない' do
        @item.shipment_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment charge must be other than 1")
      end
      it '発送元が未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数が未選択だと出品できない' do
        @item.derivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivery date must be other than 1")
      end
      it '販売価格が空だと出品できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end
      it '販売価格が300円以下だと出品できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be greater than 300")
      end
      it '販売価格が9,999,999円以上だと出品できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
      end
      it '販売価格が全角入力だと出品できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it '販売価格が半角英数の混合だと出品できない' do
        @item.selling_price = '4ttt'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
      it '販売価格が半角英字だけだと出品できない' do
        @item.selling_price = 'hoge'
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price is not a number")
      end
    end
  
  end
end
