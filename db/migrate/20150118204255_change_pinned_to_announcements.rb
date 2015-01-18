class ChangePinnedToAnnouncements < ActiveRecord::Migration
  def change
    rename_column :messages, :pinned_post, :announcement
  end
end
