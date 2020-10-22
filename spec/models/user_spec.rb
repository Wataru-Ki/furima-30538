require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上であれば登録できる" do
        @user.password = "aaaaaa1"
        @user.password_confirmation = "aaaaaa1"
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = "亜あア"
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "亜あア"
        expect(@user).to be_valid
      end
      it "ユーザー本名のふりがなは名字が全角カタカナであれば登録できる" do
        @user.family_name_kana = "ア"
        expect(@user).to be_valid
      end
      it "ユーザー本名のふりがなは名前が全角カタカナであれば登録できる" do
        @user.first_name_kana = "ア"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "メールアドレスが一意性であるか" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに＠がないと登録できない" do
        @user.email = "kkkkkkkkk"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードは空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは5文字以下だと登録できない" do
        @user.password = "aaaaa"
        @user.password_confirmation = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合ではないと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードの確認用は空だと登録できない" do
        @user.password = "aaaaaa1"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードと確認用は値が一致していないと登録できない" do
        @user.password = "aaaaaa1"
        @user.password_confirmation = "bbbbbb2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は名字が空だと登録ができない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "ユーザー本名は名前が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー本名は名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "ユーザー本名は名字が全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー本名のふりがなは名字が空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "ユーザー本名のふりがなは名前が空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー本名のふりがなは名字が全角カタカナでないと登録できない" do
        @user.family_name_kana = "aあ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "ユーザー本名のふりがなは名前が全角カタカナでないと登録できない" do
        @user.first_name_kana = "aあ亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
