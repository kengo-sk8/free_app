# README
## 概要
プログラミングスクールTECH::EXPERTの最終課題でフリーマーケットサイトを作成しました。約1ヶ月間、3人チームでアジャイル開発を行いました。

### 開発状況
- 開発環境  
  - 開発言語：  
    - Ruby/Ruby on Railsi 
  - 開発ツール：  
    - Github/AWS/Visual Studio Code  
  - データベース：  
    - MySQL  

- 開発期間  
  - 開発期間：  
    - 28日間(4/18 ~ 5/15)  
  - 平均作業時間：  
    - 12時間以上/ 1日あたり 

- 開発体制  
  - 人数：  
    - 3人  
  - 開発方式：  
    - アジャイル型開発（スクラム）  
  - タスク管理：  
    - Trelloによるタスク管理  

- 動作概要  
  - 接続先情報  
  - URL：  
    - http://18.178.152.156/ 
  - ID:  
    - kengo  
  - Pass:  
    - s72ifea3 

# kengo922の担当箇所
## 商品出品機能
![Item](https://user-images.githubusercontent.com/62418207/82029294-c4a99200-96d1-11ea-9ca8-41df2436fc33.gif)
- 商品情報を保存するItemテーブルと写真を保存するImageテーブルのレコードを1ページで作成するように実装した。また、accepts_nested_attributes_forをmodelで定義し、1つのformで値を送れるように実装。
- 画像はcarrierwaveを使用し、複数枚投稿ができる。
- カテゴリーはancestryを用い、seedに記載した親・子・孫のカテゴリーデータをDBに保存している。
- カテゴリーは親カテゴリーを選択すると、子カテゴリー、孫カテゴリーのセレクトボックスが出現するよう非同期にて実装した。
- その他の選択項目は、active_hashを用いモデル内にデータを保存している。
- バリデーションを設定し、必須項目が抜けていると登録できないようになっている。


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|email|string|null: false| [](メールアドレス)
|phone_number|string|| [](電話番号)
|password|string|null: false| [](パスワード)
|birthday_year_id|integer|null: false|
|birthday_moon_id|integer|null: false|
|birthday_day_id|integer|null: false|
|self_introduce|text|-------| [](自己紹介文)

## Association
- has_many :items
- has_many :comments
- has_one :address
- has_one :card 
- has_many :sns_credentials
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_moom
- belongs_to_active_hash :birth_day     


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|name|text|null: false| [](商品名)
|content|string|null: false| [](商品の説明)
|brand|string|| [](ブランド)
|category|references|null: false, default: 0| [](カテゴリー)
|condition|references|null: false| [](商品の状態)
|size|references|null: false, default: 0| [](商品のサイズ)
|delivery_date|references|null: false, default: 0| [](配送日)
|delivery_fee|references|null: false, default: 0| [](配送料の負担)
|prefecture|references|null: false, default: 0| [](発送元の地域)
|delivery_way|references|null: false, default: 0| [](配送方法)
|price|integer|null: false| [](販売価格)
|buyer_id|integer|foreign_key: true|

### Association
- belongs_to :user
- has_many :category
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- belongs_to_active_hash :condition, resence: true 
- belongs_to_active_hash :size, presence: true
- belongs_to_active_hash :delivery_date, presence: true
- belongs_to_active_hash :delivery_fee, presence: true
- belongs_to_active_hash :prefecture, presence: true
- belongs_to_active_hash :delivery_way, presence: true 


## Commentsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item|reference|null: false|
|user|reference|null: false|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

## Association
- belongs_to :user


## Address
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|postal_code|string|null: false| [](郵便番号)
|prefecture_code|string|null: false| [](都道府県)
|city_name|string|null: false| [](市)
|street|string|null: false| [](番地、町)

## Association
- belongs_to :user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|| 
|name|string|null: false| [](カテゴリー)

## Association
- has_many :items
- has_ancestry


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|| 
|item_id|references|null: false|

## Association
- belongs_to :item
- mount_uploader :src, ImageUploader


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user|references|foreign_key: true|
### Association
- belongs_to :user, optional: true, dependent: :destroy