class SessionsController < ApplicationController
  skip_before_filter :ensure_logged_in

  def create
    user = User.from_auth(auth_hash)
    session[:username] = user.username

    user.import! if user.imports.empty?
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
