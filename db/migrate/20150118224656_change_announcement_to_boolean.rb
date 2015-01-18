class ChangeAnnouncementToBoolean < ActiveRecord::Migration
  def change
    change_column :messages, :announcement, :boolean, null: false, default: false
  end
end
