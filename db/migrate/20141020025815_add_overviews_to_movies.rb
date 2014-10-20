class AddOverviewsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :overviews, :text
  end
end
