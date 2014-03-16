module ActivityHelper
  def short_sha(sha)
    sha[0..7]
  end

  def render_event(event)
    render event.class.to_s.underscore, event: event
  end
end
