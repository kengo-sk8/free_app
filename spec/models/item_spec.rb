require 'rails_helper' 
describe Item do #必ず頭文字を大文字で記述する。また、describeは、do ~ endまでのテストのまとまりを作る。
  describe '#create' do #describeは、ネストして作成する事が出来る。「itemクラスにあるcreateメソッドをテストするまとまり」であることを示している。
    #describeとdoの間にメソッド名を書く際は#をつけるのが慣習らしい。

    it "nameがない場合は登録できないこと" do   #it ~ doの間はそのexampleでどんなテストをしているか説明文を記入する
      item = build(:item, name: nil)
      item.valid? #この記述(valid?)により「バリデーションにより保存ができない状態であるか」を確認する。
      expect(item.errors[:name]).to include("を入力してください") 
      #errors ： valid?メソッドを利用したインスタンスに対してerrorsメソッドを利用すると、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認する事が出来る。
      #includeマッチャ : 引数の値(上記の場合は、(:item, name: nil)が引数)がexpectの引数である配列に含まれているかをチェックすることができる。
      #今回の場合、「nameが空の場合は名前を入力してくださいというエラーが出るはずだ」ということがわかっている為、include("を入力してください")のように書く事が出来る。
    end

    it "contentがない場合は登録できないこと" do
      item = build(:item, content: nil)
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end

    it "contentが40文字以内でないと登録できないこと" do
      item = build(:item, content: "abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz")
      item.valid?
      expect(item).to be_invalid
    end


    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "delivery_wayがない場合は登録できないこと" do
      item = build(:item, delivery_way: nil)
      item.valid?
      expect(item.errors[:delivery_way]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      item = build(:item, delivery_date: nil)
      item.valid?
      expect(item.errors[:delivery_date]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "priceは300円以下の登録ができないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item).to be_invalid
    end
  end

  describe '#update' do

    it "item_nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "contentが40文字以内でないと登録できないこと" do
      item = build(:item, content: "abcdefghijklmnopqrstuvwxyz,abcdefghijklmnopqrstuvwxyz")
      item.valid?
      expect(item).to be_invalid
    end

    it "descriptionがない場合は登録できないこと" do
      item = build(:item, content: nil)
      item.valid?
      expect(item.errors[:content]).to include("を入力してください")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition_id: nil)
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "sizeがない場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      item = build(:item, delivery_fee: nil)
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "delivery_wayがない場合は登録できないこと" do
      item = build(:item, delivery_way: nil)
      item.valid?
      expect(item.errors[:delivery_way]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end

    it "delivery_dateがない場合は登録できないこと" do
      item = build(:item, delivery_date: nil)
      item.valid?
      expect(item.errors[:delivery_date]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    
    it "priceは300円以下の登録ができないこと" do
      item = build(:item, price: "299")
      item.valid?
      expect(item).to be_invalid
    end
  end
end