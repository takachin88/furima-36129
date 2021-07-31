require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user=FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録出来るとき' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_katakana,last_name_katakana,bith_dayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ないとき' do
      it "nicknameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
        
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できないこと " do
        @user.save
        another_user=FactoryBot.build(:user)
        another_user.email=@user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは@を含まないと登録できないこと" do
        @user.email = "pppp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "kkkk"
        @user.password_confirmation="kkkk"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは英語のみでは登録できないこと" do
        @user.password = "kkkkkk"
        @user.password_confirmation="kkkkkk"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字でなければ登録できない")
      end

      it "passwordは数字のみでは登録できないこと" do
        @user.password = "111111"
        @user.password_confirmation="111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字でなければ登録できない")
      end

      it "passwordは全角では登録できないこと" do
        @user.password = "あいうえおか"
        @user.password_confirmation="あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字でなければ登録できない")
      end

      it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
        @user.password = "moto1208"
        @user.password_confirmation="moto1200"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "first_nameが漢字、ひらがな、カタカナ以外では登録できないこと" do
        @user.first_name = "ooooo"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 漢字・平仮名・カタカナ以外では登録できない")
      end

      it "last_nameが漢字、ひらがな、カタカナ以外では登録できないこと" do
        @user.last_name = "ooooo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 漢字・平仮名・カタカナ以外では登録できない")
      end

      it "first_name_katakanaが全角カタカナ以外では登録できないこと" do
        @user.first_name_katakana = "あいうえお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana は全角カタカナで入力して下さい")
      end
      
      it "last_name_katakanaが全角カタカナ以外では登録できないこと" do
        @user.last_name_katakana = "かきくけこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana は全角カタカナで入力して下さい")
      end

      it "first_nameがないと登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameがないと登録できないこと" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_katakanaがないと登録できないこと" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it "last_name_katakanaがないと登録できないこと" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "birth_dayがないと登録できないこと" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end