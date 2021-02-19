require 'rails_helper'

RSpec.describe RegisterInformation, type: :model do
  describe '商品購入情報と宛先の保存' do
    before do
      @register_information = FactoryBot.build(:register_information)
    end

    it '必須条件が正しく入力されていれば保存できる' do
      expect(@register_information).to be_valid
    end
    it 'optional_addressはなくても保存できる' do
      @register_information.optional_address = ''
      expect(@register_information).to be_valid
    end

    it 'tokenがなければ保存ができない' do
      @register_information.token = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号がなければ保存できない' do
      @register_information.postcode = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Postcode can't be blank")
    end
    it '郵便番号にハイフンがなけらば保存できない' do
      @register_information.postcode = '1234567'
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Postcode Input currectly")
    end
    it 'municipalityがなければ保存できない' do
      @register_information.municipality = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'prefecture_idが1だと保存できない' do
      @register_information.prefecture_id = 1
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Prefecture Select")
    end
    it 'addressがなければ保存できない' do
      @register_information.address = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberがなければ保存できない' do
      @register_information.phone_number = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_nuberが半角数字でなければ保存できない' do
      @register_information.phone_number = '０９０１２３４５６７８'
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが半角英数混合だと登録できない' do
      @register_information.phone_number = '090aaaa1234'
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Phone number is not a number")
    end
    it 'phone_numberが11桁の数字でないと保存できない' do
      @register_information.phone_number = '0123456789'
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Phone number Input 11characters")
    end
    it 'phone_numberが12桁以上だと保存できない ' do
      @register_information.phone_number = '090123456789'
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Phone number Input 11characters")
    end
    it 'user_idがなければ保存できない' do
      @register_information.user_id = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idがなければ保存できない' do
      @register_information.item_id = ''
      @register_information.valid?
      expect(@register_information.errors.full_messages).to include("Item can't be blank")
    end
  end
end
