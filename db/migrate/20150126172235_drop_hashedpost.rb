class DropHashedpost < ActiveRecord::Migration
  def change
    drop_table :hashed_posts
  end
end
