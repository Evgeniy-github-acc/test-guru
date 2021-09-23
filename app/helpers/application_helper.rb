module ApplicationHelper
  
  def current_year
    Time.zone.now.year
  end

  def github_url(repo, link)
    link_to repo, link, target: :_blank
  end

  def flash_message(event)
    flash[event.to_sym]
  end
end
