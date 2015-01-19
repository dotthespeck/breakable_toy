class ChangeMessageConvotoFalseAgain < ActiveRecord::Migration
  def change
    change_column :messages, :conversation_id, :integer, null: true
  end
end
