class Movie < ActiveRecord::Base
  def self.random
    self.order("RANDOM()").first
  end
end
