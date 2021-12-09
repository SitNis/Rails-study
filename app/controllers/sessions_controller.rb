class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash[:alert] = 'Are you a Guru? Verify your Name and Password please'
      render :new
    end
  end
end
