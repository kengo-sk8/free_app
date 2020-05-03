class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.text :name, null: false
      t.string :content, null: false
      t.string :category
      t.references :condition, null: false, default: 0
      t.string :price
      t.string :prefecture_code
      t.string :deliverymethod
      t.string :deliveryburden
      t.string :deliverydate
      t.string :brand
      t.string :size
      t.string :seller
      t.timestamps
      # t.integer :user_id, null: false
      # t.text :name, null: false
      # t.string :content
      # t.string :price, null: false
      # t.integer :prefecture_code, null: false 
      # t.integer :status, null:false, default:
      # t.references :deliverymethod, null: false
      # t.references :deliveryburden, null: false
      # t.references :deliverydate, null: false
      # t.references :brand, null: false
      # t.references :upper_category, null: false
      # t.references :middle_category, null: false
      # t.references :lower_category, null: false
      # t.references :size, null: false
      # t.references :seller, null: false
      # t.timestamps
    end
  end
end
