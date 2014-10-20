class AddStuffToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :overview, :string
    add_column :movies, :tagline, :string
    add_column :movies, :budget, :integer
    add_column :movies, :revenue, :integer
    add_column :movies, :status, :string
    add_column :movies, :runtime, :string
    add_column :movies, :release_date, :string
  end
end
