class MessageCounterCache < ActiveRecord::Migration
  def change

    add_column :conversations, :messages_count, :integer, null: false, default: 0

    Conversation.pluck(:id).each do |id|
      Conversation.reset_counters(id, :messages)
    end
  end
end
