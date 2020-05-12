class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false
      t.timestamps
    end
  end
end
