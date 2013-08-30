class AddDescriptionToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :about_playlist, :text
  end
end
