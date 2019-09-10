class AddSongUidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :song_uid, :text, array: true, default: []
  end
end
