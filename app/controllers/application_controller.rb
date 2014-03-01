class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.where(username: session[:username]).first
  end

  def ensure_logged_in
    redirect_to github_auth_url unless logged_in?
  end
end
