class ChangeAnnouncementToBoolean < ActiveRecord::Migration
  def change
    change_column :messages, :announcement, 'boolean USING CAST(announcement AS boolean)'
  end
end
