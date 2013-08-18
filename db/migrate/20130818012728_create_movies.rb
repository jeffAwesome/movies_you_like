class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.belongs_to :playlist, index: true
      t.string :title
      t.string :thumbnail
      t.integer :mov_id

      t.timestamps
    end
  end
end
