class MakeProperChanges < ActiveRecord::Migration
  def change
    rename_column :hashed_posts, :conversation_id, :message_id
  end
end
