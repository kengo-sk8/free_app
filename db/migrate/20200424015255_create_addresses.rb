class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :postal_code, null: false
      t.string :prefecture_code, null: false
      t.string :city_name, null: false
      t.string :street, null: false
      t.timestamps
    end
  end
end
