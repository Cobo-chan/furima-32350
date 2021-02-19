require 'rails_helper'

RSpec.describe StreetAddress, type: :model do
  describe 'アソシエーションの確認' do
    before do
      @street_address = FactoryBot.create(:street_address)
    end

    it 'street_addressに紐づくorderがなければ保存できない' do
      @street_address.order = nil
      @street_address.valid?
      expect(@street_address.errors.full_messages).to include("Order must exist")
    end
  end
end
