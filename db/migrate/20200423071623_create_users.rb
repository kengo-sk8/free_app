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
