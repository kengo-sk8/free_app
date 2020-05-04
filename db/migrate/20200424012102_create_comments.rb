class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :comment
      t.string :item
      t.string :user
      t.timestamps
    end
  end
end

