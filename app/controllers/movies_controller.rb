class MoviesController < ApplicationController
  include ActiveModel::Validations

  def show
    @movie = Tmdb::Movie.detail(params[:id])

    @images = Tmdb::Movie.images(params[:id])
    @cast = Tmdb::Movie.casts(params[:id])
    @trailers = Tmdb::Movie.trailers(params[:id])
    @similar_movies = Tmdb::Movie.similar_movies(params[:id])

    @review = Review.new
    @reviews = Review.where(movie_id: @movie.id)

    @playlist_movie = PlaylistMovie.new
    @playlist = Playlist.new

    if current_user
      @playlists = current_user.playlists.all
    else
      @playlists = {}
    end

    @user = current_user
    @mov_id = @movie.id
    @thumbnail = @movie.poster_path
    @title = @movie.title
    Movie.where({
      id: @movie.id,
      title: @movie.title,
      mov_id: @movie.id,
      thumbnail: @movie.poster_path,
      overviews: @movie.overview,
      tagline:  @movie.tagline,
      runtime: @movie.runtime.to_s,
      release_date: @movie.release_date,
    }).first_or_create


  end

end
