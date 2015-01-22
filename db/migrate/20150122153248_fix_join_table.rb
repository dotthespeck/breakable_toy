class FixJoinTable < ActiveRecord::Migration
  def change
    drop_table :hashed_posts
  end

  def change
    create_table :hashed_messages do |t|
      t.belongs_to :message
      t.belongs_to :hashtag

      t.timestamps
    end
  end
end
