class ChangeHashedTable < ActiveRecord::Migration
  def change
    rename_column :hashed_posts, :hashtag_id, :hashtag_keyword_id
  end
end
