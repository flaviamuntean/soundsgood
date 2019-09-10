class AddSpotifyFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :top_artists, :string
    add_column :users, :top_tracks, :string
  end
end
