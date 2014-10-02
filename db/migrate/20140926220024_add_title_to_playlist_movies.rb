class AddTitleToPlaylistMovies < ActiveRecord::Migration
  def change
    add_column :playlist_movies, :thumbnail, :string
    add_column :playlist_movies, :title, :string
  end
end
