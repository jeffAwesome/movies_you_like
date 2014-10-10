class Movie < ActiveRecord::Base
  has_many :LikeMovie
  def self.random
    self.order("RANDOM()").first
  end
end
