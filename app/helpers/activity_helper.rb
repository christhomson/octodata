module ActivityHelper
  def short_sha(sha)
    sha[0..7]
  end

  def render_event(event)
    render event.class.to_s.underscore, event: event
  end

  def link_to_repository(repository)
    link_to repository.display_name, "https://github.com/#{repository.display_name}"
  end
end
