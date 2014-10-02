class Review < ActiveRecord::Base
  validates :rating,
    :inclusion  => { :in => 1..5,
    :message    => "%{value} is not a valid movie rating" }
end
