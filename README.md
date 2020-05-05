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


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|name|text|null: false| [](商品名)
|content|string|-------| [](商品の説明)
|price|string|null: false| [](商品の説明)
|prefecture_code|integer(11)|null: false| [](発送元の地域)
|status|integer(2)|null:false, default: 0| [](配送料の負担) 
|deliverymethod|reference|null: false, foreign_key: true|
|deliveryburden|reference|null: false, foreign_key: true|
|deliverydate|reference|null: false, foreign_key: true|
|brand|reference|null: false, foreign_key: true| [](ブランド)
|upper_category|reference|null: false, foreign_key: true| [](カテゴリーupper)
|middle_category|reference|null: false, foreign_key: true| [](カテゴリーmiddle)
|lower_category|reference|null: false, foreign_key: true| [](カテゴリーlower)
|size|reference|null: false, foreign_key: true| [](商品のサイズ)
|seller|reference|null: false, foreign_key: true| [](販売価格)

### Association
- has_many :comments
- belongs_to :user


## Commentsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|comment|text|null: false|
|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

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
