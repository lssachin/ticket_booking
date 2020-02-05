class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to '/mybookings'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
