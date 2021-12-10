class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:previous_url]
        redirect_to cookies[:previous_url]
      else
        redirect_to tests_path
      end
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
