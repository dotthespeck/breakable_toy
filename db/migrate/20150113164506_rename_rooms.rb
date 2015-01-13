class RenameRooms < ActiveRecord::Migration
    def up
      rename_table :rooms, :conversations
    end

    def down
      rename_table :conversations, :rooms
    end
  end
