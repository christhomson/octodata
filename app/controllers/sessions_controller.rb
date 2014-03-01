class SessionsController < ApplicationController
  def create
    user = User.from_auth(auth_hash)
    session[:username] = user.username

    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
