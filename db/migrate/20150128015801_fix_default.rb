class FixDefault < ActiveRecord::Migration
  def change
    change_column :messages, :reply_count, :integer, default: 0, null: false
  end
end
