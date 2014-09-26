class MoviesController::LikeMoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie

  def create

  end


  private

    def set_movie

    end
end
