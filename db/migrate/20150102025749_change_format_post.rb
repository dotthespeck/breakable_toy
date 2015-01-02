class ChangeFormatPost < ActiveRecord::Migration
  def change
    change_column :conversations, :post, :string
  end
end
