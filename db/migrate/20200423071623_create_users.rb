class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :email, null: false
      t.string :phone_number
      t.string :password, null: false
      t.integer :birthday_year_id, null: false
      t.integer :birthday_moon_id, null: false
      t.integer :birthday_day_id, null: false
      t.text :self_introduce
      t.timestamps
    end
  end
end	
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