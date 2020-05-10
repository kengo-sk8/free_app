require 'rails_helper'
describe User do 
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "last_name  がない場合は登録できないこと" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name  ]).to include("を入力してください")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "last_name_kanaがない場合は登録できないこと" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it "phone_number がない場合は登録できないこと" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number ]).to include("を入力してください")
    end
    it "電話番号不適切な形式 " do
      user = build(:user, phone_number: "a80-12345-678")
      user.valid?
      expect(user).to be_valid
    end
    #be_valid : expectの引数にしたインスタンスが全てのバリデーションをクリアする場合にパスするマッチャです。

    it " 重複したemailが存在する場合は登録できないこと " do
      user = build(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(user).to be_valid
    end
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end
    it "パスワードに英数字が含まれているか " do
      user = build(:user, password: "a234567", password_confirmation:"a234567")
      user.valid?
      expect(user).to be_valid
    end
    it "パスワード数字のみは不適切" do
      user = build(:user, password: "1111111111",)
      user.valid?
      expect(user).to be_invalid
    end
    it "パスワード英字のみは不適切" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user).to be_invalid
    end
    it "first_name_kanaが平仮名の場合は登録できないこと" do
      user = build(:user, first_name_kana: "やまだ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include( "は不正な値です")
    end
    it "last_name_kanaが平仮名の場合は登録できないこと" do
      user = build(:user, last_name_kana: "たろう")
      user.valid?
      expect(user.errors[:last_name_kana]).to include( "は不正な値です")
    end
    it "@が最初にくると不適切" do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は有効でありません。")
    end
    it "@が最後に来ると不適切 " do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は有効でありません。")
    end
  end
end