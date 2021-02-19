require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'アソシエーションの確認' do
    before do
      @order = FactoryBot.create(:order)
    end

    it 'orderに紐づくuserがなければ保存できない' do
      @order.user = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User must exist")
    end
    it 'orderに紐づくitemがなければ保存できない' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item must exist")
    end
  end
end
