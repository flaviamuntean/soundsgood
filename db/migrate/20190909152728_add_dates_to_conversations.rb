class AddDatesToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :created_at, :datetime, null: false
    add_column :conversations, :updated_at, :datetime, null: false
  end
end
