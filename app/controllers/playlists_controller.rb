class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = current_user.playlists.all
    render :layout => "admin"
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    @movies = Movie.where('playlist_id = ?', Playlist.find(params[:id]))
    render :layout => "admin"
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    @user = current_user
    render :layout => "admin"
  end

  # GET /playlists/1/edit
  def edit
    @user = @playlist.user_id
    if @user == current_user.id
     render :layout => "admin"
    else
      redirect_to playlists_path(), notice: 'You do not have access to edit this playlist'
    end
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlists = current_user.playlists.count

    respond_to do |format|
      if @playlist.save && @playlists == 0
        format.html { redirect_to :back, notice: 'Playlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @playlist }
      elsif @playlist.save
        format.html { redirect_to playlists_path(), notice: 'Playlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @playlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:title, :user_id, :about_playlist)
    end
end
