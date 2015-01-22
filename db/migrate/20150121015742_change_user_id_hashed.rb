class ChangeUserIdHashed < ActiveRecord::Migration
  def change
    rename_column :hashed_posts, :user_id, :conversation_id
  end
end
