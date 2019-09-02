class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :text
    add_column :users, :address, :string
    add_column :users, :spotify_config, :text
    add_column :users, :active_profile, :boolean, default: false
  end
end
