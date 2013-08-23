class StaticController < ApplicationController
  def index
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
  end

  def exactMovie
  end

  def about
  end

end
