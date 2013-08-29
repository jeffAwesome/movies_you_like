class StaticController < ApplicationController
  def index
    signed_in_playlists
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
    signed_in_playlists
    cookies[:mov_id] = params[:movieID] unless user_signed_in?
    if user_signed_in?
      @playlists = current_user.playlists.all
    end
    @playlist = Playlist.new
    @movie = Movie.new
  end

  def exactMovie
  end

  def about
  end

  def signed_in_playlists
    if user_signed_in? && current_user.playlists.count == 0
      Playlist.create(title: 'default', user_id: current_user.id)
    end
  end

end
