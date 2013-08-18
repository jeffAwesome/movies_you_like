class Movie < ActiveRecord::Base
  validates :playlist_id, :presence => true
  belongs_to :playlist
end
