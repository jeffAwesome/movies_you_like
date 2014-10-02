class AddTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :rating, :integer
  end
end
