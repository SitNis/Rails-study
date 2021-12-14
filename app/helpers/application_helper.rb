module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author,repo)
    link_to "Ссылка на проект", "https://github.com/#{author}/#{repo}/", rel: "nofollow", target:"_blank"
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :div, msg, :id => key, :class => 'flash'
    end.join.html_safe
  end
end
