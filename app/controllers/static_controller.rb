class StaticController < ApplicationController
  def index
    if user_signed_in? && current_user.playlists.count == 0
      Playlist.create(title: 'default', user_id: current_user.id)
    end

    if cookies[:mov_id] && user_signed_in?
      redirect_to "/static/view?movieID=#{cookies[:mov_id]}"
      cookies.delete :mov_id
    else
      render :layout => "home"
    end

      end
  def related
  end

  def view
    cookies[:mov_id] = params[:movieID] unless user_signed_in?

    @playlist = Playlist.new
    @movie = Movie.new

  end

  def exactMovie
  end

  def about
  end

end
