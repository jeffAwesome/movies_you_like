class MoviesController < ApplicationController
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
    @movie = Movie.new
    @playlist = Playlist.new
    @playlists = current_user.playlists.all
    @user = current_user
    @mov_id = params[:mov_id]
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
    @movie = Movie.new(movie_params)
    respond_to do |format|
      if @movie.save
        format.html { redirect_to "/static/view?movieID=#{@movie.mov_id}",  notice: 'Movie was successfully added to your playlist.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @playlists = current_user.playlists.all
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:playlist_id, :title, :thumbnail, :mov_id)
    end
end
