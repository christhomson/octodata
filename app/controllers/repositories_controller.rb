class RepositoriesController < ApplicationController
  before_filter :ensure_logged_in

  def index
    @repositories = current_user.repositories
  end
end
