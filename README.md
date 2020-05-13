# README

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
- has_many :likes, dependent: :destroy
- has_many :like_items, through: :likes, source: :item

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
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user

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

## Association
- belongs_to :user, optional: true, dependent: :destroy


## likelsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true, null: false|
|item|references|foreign_key: true, null: false|

## Association
- belongs_to :user
- belongs_to :item