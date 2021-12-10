class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:previous_url] || tests_path
      cookies.delete(:previous_url)
    else
      flash[:alert] = 'Are you a Guru? Verify your Name and Password please'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
