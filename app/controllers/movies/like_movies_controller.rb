class Movies::LikeMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def create
    LikeMovie.where(user_id: current_user.id, id: @movie.id).first_or_create!
    respond_to do |format|
      format.html { redirect_to @movie }
      format.js
    end
  end

  def destroy
    LikeMovie.where(user_id: current_user.id, id: @movie.id).destroy_all
    respond_to do |format|
      format.html { redirect_to @movie }
      format.js
    end
  end


  private

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
