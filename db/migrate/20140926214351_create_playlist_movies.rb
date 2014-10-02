class CreatePlaylistMovies < ActiveRecord::Migration
  def change
    create_table :playlist_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
