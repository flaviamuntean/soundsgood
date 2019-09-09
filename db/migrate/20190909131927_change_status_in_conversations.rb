class ChangeStatusInConversations < ActiveRecord::Migration[5.2]
  def change
    change_column :conversations, :status, :string, default: "pending"
  end
end
