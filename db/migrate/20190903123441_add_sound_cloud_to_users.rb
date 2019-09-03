class AddSoundCloudToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :soundcloud_profile, :string
  end
end
