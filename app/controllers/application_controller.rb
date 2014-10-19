class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_config
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]

  Tmdb::Api.key("8e7c67585fa149a56537b63fe68776ae")

  protected

  def set_config
    @configuration = Tmdb::Configuration.new
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

  end


end
