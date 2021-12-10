module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author,repo)
    link_to "Ссылка на проект", "https://github.com/#{author}/#{repo}/", rel: "nofollow", target:"_blank"
  end

  def flash_message(flash_type)
    if flash[flash_type]
      content_tag :p, flash[flash_type], class: 'flash alert'
    end
  end
end
