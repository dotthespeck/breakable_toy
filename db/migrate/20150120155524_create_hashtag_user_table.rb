class CreateHashtagUserTable < ActiveRecord::Migration
  def change
    create_table :hashed_posts do |t|
        t.integer :hashtag_id, null: false
        t.integer :user_id, null: false

        t.timestamps
    end
  end
end
