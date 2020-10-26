require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/camera.png')
  end

  describe "商品出品機能" do
    context "商品出品がうまくいくとき" do
      it "入力必須項目を全て記入すれば登録できる" do
        expect(@item).to be_valid
      end
    end
  
    context "商品出品がうまくいかないとき" do
      it "商品名がないと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと登録できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "カテゴリーの情報がないと登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報がないと登録できない" do
        @item.item_condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end
      it "配送料の負担についての情報がないと登録できない" do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it "発送元の地域についての情報がないと登録できない" do
        @item.shipping_area_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it "発送までの日数についての情報がないと登録できない" do
        @item.shipping_date_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "価格についての情報がないと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が¥300以下だと登録できない" do
      end
      it "価格が¥10,000,000以上だと登録できない" do
      end
      it "販売価格が全角数字だと登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
