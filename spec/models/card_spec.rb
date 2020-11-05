require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe "商品購入機能" do
    context "商品購入がうまくいくとき" do
      it "入力必須項目を全て記入すれば登録できる" do
        expect(@card).to be_valid
      end
      it "建物番号がなくても登録できる" do
        @card.building_number = ""
        expect(@card).to be_valid
      end
      it "電話番号が11桁以内ならば登録できる" do
        @card.telephone_number = "090123456"
        expect(@card).to be_valid
      end
    end

    context "商品購入がうまくいかないとき" do
      it "都道府県の情報がないと登録できない" do
        @card.prefecture_id = 1
        @card.valid?
        expect(@card.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市町村がないと登録できない" do
        @card.municipalities = ""
        @card.valid?
        expect(@card.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "住所がないと登録できない" do
        @card.address = ""
        @card.valid?
        expect(@card.errors.full_messages).to include("Address can't be blank")
      end
      it "郵便番号がないと登録できない" do
        @card.postal_code = ""
        @card.valid?
        expect(@card.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @card.postal_code = "1234567"
        @card.valid?
        expect(@card.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号がないと登録できない" do
        @card.telephone_number = ""
        @card.valid?
        expect(@card.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "電話番号にハイフンがあると登録できない" do
        @card.telephone_number = "090-1234-5678"
        @card.valid?
        expect(@card.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @card.token = ""
        @card.valid?
        expect(@card.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end