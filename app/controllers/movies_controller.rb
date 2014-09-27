class MoviesController < ApplicationController
  include ActiveModel::Validations

  def show
  	@movie = Tmdb::Movie.detail(params[:id])
        Movie.where({
          id: @movie.id,
          title: @movie.title,
          mov_id: @movie.id,
          thumbnail: @movie.poster_path
        }).first_or_create!
  	@images = Tmdb::Movie.images(params[:id])
  	@cast = Tmdb::Movie.casts(params[:id])
  	@trailers = Tmdb::Movie.trailers(params[:id])
  	@similar_movies = Tmdb::Movie.similar_movies(params[:id])

    
    @playlist_movie = PlaylistMovie.new
    @playlist = Playlist.new
    @playlists = current_user.playlists.all
    @user = current_user
    @mov_id = @movie.id
    @thumbnail = @movie.poster_path
    @title = @movie.title


  end

end
