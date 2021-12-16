class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gists.all
  end
end