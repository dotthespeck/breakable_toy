class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :user_id
      t.integer :parent_id
      t.integer :reply_count
      t.text  :post, null: false
      t.text :pinned_post

      t.timestamps
    end
  end
end
