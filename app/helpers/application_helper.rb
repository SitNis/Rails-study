module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author,repo)
    link_to "Ссылка на проект", "https://github.com/#{author}/#{repo}/", rel: "nofollow", target:"_blank"
  end
end
