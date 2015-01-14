class UserCreatesConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :user_id, :integer, null: false
  end
end
