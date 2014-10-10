class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id)
    @likes = LikeMovie.where(user_id: @user.id)
    @playlists = Playlist.where(user_id: @user.id)

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end