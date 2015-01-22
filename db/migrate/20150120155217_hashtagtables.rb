class Hashtagtables < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.text  :hashtag_keyword, null: false

      t.timestamps
    end
  end
end
