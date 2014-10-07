class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }

  has_many :playlists
  has_many :movie_likes
  has_many :reviews

  def likes?(movie)
    LikeMovie.where(user_id: id, movie_id: movie).any?
  end

end
