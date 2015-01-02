class CreateConversation < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.text  :post, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
