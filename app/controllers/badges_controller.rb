class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges = Badge.all
    set_user_badges
  end

  private

  def set_user_badges
    @user_badges = current_user.badges
  end
end