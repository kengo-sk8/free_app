class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.text :comment, null: false 
      t.reference :item, null: false, foreign_key: true
      t.reference :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

