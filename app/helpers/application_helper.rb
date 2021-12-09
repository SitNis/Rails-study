module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author,repo)
    link_to "Ссылка на проект", "https://github.com/#{author}/#{repo}/", rel: "nofollow", target:"_blank"
  end

  def flash_message
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end
end
