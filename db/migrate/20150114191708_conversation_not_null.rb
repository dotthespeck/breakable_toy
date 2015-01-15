class ConversationNotNull < ActiveRecord::Migration
  def change
    change_column :messages, :conversation_id, :integer, null: false
  end
end
