class PlaylistMoviesController < ApplicationController
  include ActiveModel::Validations

  before_action :set_movie, only: [:show, :edit, :update, :destroy]



  # GET /movies
  # GET /movies.json
  def index
    redirect_to playlists_path()
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @playlist_movie = PlaylistMovie.new
    @playlist = Playlist.new
    @playlists = current_user.playlists.all
    @user = current_user
    @mov_id = params[:mov_id]
    @movie = Movie.find(params[:id])
    @thumbnail = params[:thumbnail]
    @title = params[:title]

    #redirect_to new_playlist_path(:mov_id => @mov_id), notice: 'You need to create a playlist before you can add a movie' if @playlists.count == 0

  end

  # GET /movies/1/edit
  def edit
    @playlists = current_user.playlists.all
  end

  # POST /movies
  # POST /movies.json
  def create
    @playlist_movie = PlaylistMovie.new(movie_params)
    respond_to do |format|
      if @playlist_movie.save
        format.html { redirect_to playlist_path(@playlist_movie.playlist_id),  notice: 'Movie was successfully added to your playlist.' }
        format.json { render action: 'show', status: :created, location: @playlist_movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @playlist_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @playlists = current_user.playlists.all
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to playilst_path(@playlist.playlist_id), notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @playlist_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    playlist = PlaylistMovie.find(params[:id]).playlist_id
    @playlist_movie.destroy
    respond_to do |format|
      format.html { redirect_to playlist_path(playlist) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @playlist_movie = PlaylistMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:playlist_movie).permit(:playlist_id, :user_id, :movie_id, :title, :thumbnail)
    end
end
