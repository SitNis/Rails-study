module ApplicationHelper
  def current_year
    Date::today::year
  end

  def github_url(author,repo)
    link_to "Ссылка на проект", "https://github.com/#{author}/#{repo}/", rel: "nofollow", target:"_blank"
  end
end
