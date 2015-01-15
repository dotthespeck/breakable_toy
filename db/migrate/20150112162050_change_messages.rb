class ChangeMessages < ActiveRecord::Migration
  def up
    drop_table :conversations
  end

  def down
    create_table :conversations do |t|
      t.string   "post",       null: false
      t.integer  "user_id",    null: false
      t.timestamps
    end
  end
end
