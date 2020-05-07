class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.text :name, null: false
      t.string :content, null: false
      t.string :brand
      t.references :category, null: false, default: 0
      t.references :condition, null: false, default: 0
      t.references :size, null: false, default: 0
      t.references :delivery_date, null: false, default: 0
      t.references :delivery_fee, null: false, default: 0
      t.references :prefecture, null: false, efault: 0
      t.references :delivery_way, null: false, default: 0
      t.integer :price,null: false
      t.integer :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end
